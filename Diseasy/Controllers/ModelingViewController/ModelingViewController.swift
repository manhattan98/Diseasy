//
//  ModelingViewController.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 04.06.2021.
//

import UIKit

class ModelingViewController: UICollectionViewController {
    weak var gridLayout: UIGridLayout!
    
    weak var healthlyLabel: UILabel!
    weak var infectedLabel: UILabel!
    
    
    weak var plusButton: UIButton!
    weak var minusButton: UIButton!
    
    
    let reuseIdentifier = "Cell"
    let miscViewCornerRadius: CGFloat = 12
    
    
    var itemSizeMin: CGFloat = 16
    var indentMin: CGFloat = 2.0
    
    let maxScale: CGFloat = 3.0
    let scaleStep: CGFloat = 0.5
    
    
    var timer: Timer!
        
    
    // MARK: - Initialize model
    
    let model = DiseaseModel(groupSize: SettingsUtils.groupSize,
                             timePeriod: SettingsUtils.timePeriod,
                             infectionFactor: SettingsUtils.infectionFactor,
                             incubationPeriod: SettingsUtils.incubationPeriod,
                             symptomsPeriod: SettingsUtils.symptomsPeriod)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let itemSize = itemSizeMin
            //(self.view.frame.width - indentMin * (CGFloat(model.subjectMatrix[0].count))) / CGFloat(model.subjectMatrix[0].count)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.collectionViewLayout = UIGridLayout(itemWidth: itemSize, itemHeight: itemSize, space: indentMin)
        gridLayout = (collectionView.collectionViewLayout as! UIGridLayout)
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
                
        
        // setup scheduled model computation
        scheduleTimer()
        
        // setup zoom buttons
        setupZoomButtons()
        
        // setup stats view
        setupStatsView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    // MARK: - Setup scheduled model computation
    
    func scheduleTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: Double(SettingsUtils.timePeriod), repeats: true, block: { [weak self] timer in
            if self == nil {
                timer.invalidate()
                print("timer is invalidated")
                return
            }
            
            self?.model.stepAsync { subjects in
                guard let self = self else { return }
                
                let changedItems = Set<IndexPath>(subjects.map { IndexPath(item: $0.location.column, section: $0.location.row) })
                let changedVisibles = changedItems.intersection(self.collectionView.indexPathsForVisibleItems)
                
                //print("changed items: \(changedItems.count), but visible: \(changedVisibles.count)")
                
                if changedVisibles.count > 0 {
                    self.collectionView.reloadItems(at: Array(changedVisibles))
                }
                
                self.healthlyLabel.text = String(self.model.healthly)
                self.infectedLabel.text = String(self.model.infected)
            }
        })
    }
    
    // MARK: - Setup zoom buttons
    
    func setupZoomButtons() {
        drawZoomButtons(size: 50,
                        indent: 16,
                        backgroundColor: .white,
                        labelColor: .darkGray,
                        pressedColor: .black,
                        action: #selector(zoomPressed(_:)),
                        plus: &plusButton,
                        minus: &minusButton)
    }
    
    
    // MARK: - Setup stats view
    
    func setupStatsView() {
        drawStatisticsView(fontSize: 14,
                           indent: 16,
                           innerIndent: 8,
                           space: 16,
                           backgroundColor: .white,
                           labelColor: .darkGray,
                           healthly: &healthlyLabel,
                           infected: &infectedLabel)
        
        healthlyLabel.text = String(model.healthly)
        infectedLabel.text = String(model.infected)
    }
    
    
    // MARK: - Zoom buttons callback
    
    @objc
    func zoomPressed(_ sender: UIButton) {
        let itemSizeScaled: CGFloat
        let indentScaled: CGFloat
        
        switch sender {
        case plusButton:
            itemSizeScaled = min(max(gridLayout.itemHeight * (1 + scaleStep), itemSizeMin), itemSizeMin * maxScale)
            indentScaled = min(max(gridLayout.space * (1 + scaleStep), indentMin), indentMin * maxScale)
        case minusButton:
            itemSizeScaled = min(max(gridLayout.itemHeight / (1 + scaleStep), itemSizeMin), itemSizeMin * maxScale)
            indentScaled = min(max(gridLayout.space / (1 + scaleStep), indentMin), indentMin * maxScale)
        default:
            fatalError("unknown button pressed for zoom")
        }
        
        gridLayout.itemHeight = itemSizeScaled
        gridLayout.itemWidth = itemSizeScaled
        gridLayout.space = indentScaled
        
        gridLayout.invalidateLayout()
    }
    

    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return model.subjectMatrix.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.subjectMatrix[section].count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let subject = model.subjectMatrix[indexPath.section][indexPath.item]
        
        switch subject.currentState {
        case .Susceptible:
            cell.contentView.backgroundColor = K.STATE_SUSCEPTIBLE_COLOR
        case .InfectedIncubation:
            cell.contentView.backgroundColor = K.STATE_INCUBATION_COLOR
        case .InfectedSymptoms:
            cell.contentView.backgroundColor = K.STATE_SYMPTOMS_COLOR
        case .Recovered:
            cell.contentView.backgroundColor = K.STATE_RECOVERED_COLOR
        }
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    var isMultipleSelection = false
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let subject = model.subjectMatrix[indexPath.section][indexPath.item]
        
        model.processSubject(subject) { [self] subjects in
            self.collectionView.reloadItems(at: subjects.map { IndexPath(item: $0.location.column, section: $0.location.row) })
            self.healthlyLabel.text = String(self.model.healthly)
            self.infectedLabel.text = String(self.model.infected)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if !isMultipleSelection {
            return model.subjectMatrix[indexPath.section][indexPath.item].currentState == .Susceptible
        } else {
            return true
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return false
    }
}
