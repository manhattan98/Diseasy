//
//  ModelingViewController.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 04.06.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class ModelingViewController: UICollectionViewController {
    weak var gridLayout: UIGridLayout!
    
    
    let itemSizeMin: CGFloat = 16
    let indentMin: CGFloat = 1
        
    let maxScale: CGFloat = 3.0
    
    
    let allowSwipeSelection = false
    let allowPanSelection = false
    

    // test data
    var data = [[UIColor]]()
    let dataMax = 32
        
    func populateTestData() {
        for i in 0 ..< dataMax {
            if i % 2 == 0 {
                data.append(Array(1 ... dataMax).map { UIColor(white: CGFloat($0) / CGFloat(dataMax), alpha: 1.0) } )
            } else {
                data.append(Array(1 ... dataMax).reversed().map { UIColor(white: CGFloat($0) / CGFloat(dataMax), alpha: 1.0) } )
            }
        }
    }
    
    
    override func viewDidLoad() {
        
        populateTestData()
        
        
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = UIGridLayout(itemWidth: itemSizeMin, itemHeight: itemSizeMin, space: indentMin)
        gridLayout = (collectionView.collectionViewLayout as! UIGridLayout)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.delaysContentTouches = true
        
        collectionView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(onPinch)))
        
        collectionView.allowsMultipleSelection = allowSwipeSelection
                                
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    // MARK: - Pinch callback
    
    @objc
    func onPinch(_ sender: UIGestureRecognizer) {
        guard let recognizer = sender as? UIPinchGestureRecognizer else { return }
        
        let itemSizeScaled = min(max(gridLayout.itemHeight * recognizer.scale, itemSizeMin), itemSizeMin * maxScale)
        
        let indentScaled = min(max(gridLayout.space * recognizer.scale, indentMin), indentMin * maxScale)
        
        //let curPosition = collectionView.indexPathsForVisibleItems[collectionView.indexPathsForVisibleItems.count / 2]
        
        gridLayout.itemHeight = itemSizeScaled
        gridLayout.itemWidth = itemSizeScaled
        gridLayout.space = indentScaled
                    
        gridLayout.invalidateLayout()
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
                
        let value = data[indexPath.section][indexPath.row]
        
        // Configure the cell
        cell.backgroundColor = value
        
        //print(collectionView.subviews.count)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    var isMultipleSelection = false
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
                
        data[indexPath.section][indexPath.row] = .green
        
        cell?.backgroundColor = data[indexPath.section][indexPath.row]
        
        print("selected item (\(indexPath.section), \(indexPath.row)) in multiple selection: \(isMultipleSelection)")
        print()
        //print(cell?.isSelected ?? false)
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if !isMultipleSelection {
            return true
        } else {
            return true
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        return allowPanSelection
    }
    
    override func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        //cell?.backgroundColor = .black
        isMultipleSelection = true
        
        print("did begin multiple selection at item (\(indexPath.section), \(indexPath.row))")
    }
    
    override func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView) {
        isMultipleSelection = false
        
        print("did end multiple selection")
    }
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
