//
//  ParametersViewController.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 03.06.2021.
//

import UIKit

class ParametersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    let settings: [SettingItem] = [
        .SettingSliderItem(get: { Float(SettingsUtils.groupSize) },
                           set: { val in SettingsUtils.groupSize = Int(val) },
                           title: K.GROUP_SIZE,
                           description: K.GROUP_SIZE_DESC,
                           min: Float(DiseaseModel.Defaults.groupSize.min),
                           max: Float(DiseaseModel.Defaults.groupSize.max),
                           fractionDigits: 0,
                           showValue: true),
        .SettingStepperItem(get: { Double(SettingsUtils.timePeriod) },
                            set: { val in SettingsUtils.timePeriod = Float(val) },
                            title: K.TIME_PERIOD,
                            description: K.TIME_PERIOD_DESC,
                            min: Double(DiseaseModel.Defaults.timePeriod.min),
                            max: Double(DiseaseModel.Defaults.timePeriod.max),
                            step: 1,
                            fractionDigits: 0),
        .SettingStepperItem(get: { Double(SettingsUtils.infectionFactor) },
                            set: { val in SettingsUtils.infectionFactor = Int(val) },
                            title: K.INFECTION_FACTOR,
                            description: K.INFECTION_FACTOR_DESC,
                            min: Double(DiseaseModel.Defaults.infectionFactor.min),
                            max: Double(DiseaseModel.Defaults.infectionFactor.max),
                            step: 1,
                            fractionDigits: 0),
        .SettingSliderItem(get: { Float(SettingsUtils.incubationPeriod) },
                           set: { val in SettingsUtils.incubationPeriod = val },
                           title: K.INCUBATION_PERIOD,
                           description: K.INCUBATION_PERIOD_DESC,
                           min: DiseaseModel.Defaults.incubationPeriod.min,
                           max: DiseaseModel.Defaults.incubationPeriod.max,
                           fractionDigits: 0,
                           showValue: false),
        .SettingSliderItem(get: { Float(SettingsUtils.symptomsPeriod) },
                           set: { val in SettingsUtils.symptomsPeriod = val },
                           title: K.SYMPTOMS_PERIOD,
                           description: K.SYMPTOMS_PERIOD_DESC,
                           min: DiseaseModel.Defaults.symptomsPeriod.min,
                           max: DiseaseModel.Defaults.symptomsPeriod.max,
                           fractionDigits: 0,
                           showValue: false),
        .SettingStepperItem(get: { Double(SettingsUtils.quarantineRate) },
                            set: { val in SettingsUtils.quarantineRate = Float(val) },
                            title: K.QUARANTINE_RATE,
                            description: K.QUARANTINE_RATE_DESC,
                            min: Double(DiseaseModel.Defaults.quarantineRate.min),
                            max: Double(DiseaseModel.Defaults.quarantineRate.max),
                            step: 0.1,
                            fractionDigits: 1),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: SettingSliderCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: SettingSliderCell.reusableIdentifier)
        tableView.register(UINib(nibName: SettingStepperCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: SettingStepperCell.reusableIdentifier)
        tableView.register(UINib(nibName: SettingSwitchCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: SettingSwitchCell.reusableIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //override view

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}


// MARK: - UITableViewDelegate
extension ParametersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // minimum upMargin + buttonHeight
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var fontSize: CGFloat = 17
        
        var upMargin: CGFloat = 40
        var buttonHeight: CGFloat = 50
        var buttonWidth: CGFloat = self.view.frame.width - 32
        
        
        let modelButton: UIButton = UIButton()
        
        modelButton.setTitle(K.START_MODEL, for: .normal)
        
        modelButton.frame = CGRect(x: (self.view.frame.width - buttonWidth) / 2, y: upMargin, width: buttonWidth, height: buttonHeight)
        
        
        modelButton.setTitleColor(.white, for: .normal)
        modelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        //modelButton.setTitleColor(.lightGray, for: .selected)
        
        modelButton.setBackgroundColor(.gray, for: .normal)
        
        modelButton.clipsToBounds = true
        
        modelButton.layer.cornerRadius = modelButton.frame.height / 4
                
        modelButton.addTarget(self, action: #selector(startModelPressed), for: .touchUpInside)
                        
        let view = UIView()
        
        view.addSubview(modelButton)
        
        //view.addConstraint(NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: modelButton, attribute: .centerY, multiplier: 1, constant: 1))
        
        return view//modelButton
    }
    
    @objc
    func startModelPressed(sender: UIButton) {
        print("button pressed")
        
        //saveSettings()
    }
    
}

// MARK: - UITableViewDataSource
extension ParametersViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingItem = settings[indexPath.row]
        
        switch settingItem {
        case is SettingItem.SettingSliderItem:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSliderCell.reusableIdentifier, for: indexPath) as! SettingSliderCell
            cell.selectionStyle = .none
                        
            cell.settingItem = settingItem as? SettingItem.SettingSliderItem
            
            return cell
        case is SettingItem.SettingStepperItem:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingStepperCell.reusableIdentifier, for: indexPath) as! SettingStepperCell
            cell.selectionStyle = .none
            
            cell.settingItem = settingItem as? SettingItem.SettingStepperItem
            
            return cell
        case is SettingItem.SettingSwitchItem:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchCell.reusableIdentifier, for: indexPath) as! SettingSwitchCell
            cell.selectionStyle = .none
            
            cell.settingItem = settingItem as? SettingItem.SettingSwitchItem
            
            return cell
        default:
            fatalError("unknown setting type")
        }
        
    }
    
    
}

