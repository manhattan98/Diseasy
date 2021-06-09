//
//  NodeLayout.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 06.06.2021.
//

import UIKit

class UIGridLayout: UICollectionViewFlowLayout {
    var itemWidth: CGFloat
    var itemHeight: CGFloat
    var space: CGFloat
    
    var columns: Int {
        self.collectionView!.numberOfItems(inSection: 0)
    }
    
    var rows: Int {
        self.collectionView!.numberOfSections
    }
    
    
    init(itemWidth: CGFloat, itemHeight: CGFloat, space: CGFloat) {
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
        self.space = space
        
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        self.itemWidth = 50
        self.itemHeight = 50
        self.space = 3
        
        super.init()
    }
    
    
    override var collectionViewContentSize: CGSize {
        let w = CGFloat(columns) * (itemWidth + space)
        let h = CGFloat(rows) * (itemHeight + space)
        
        return CGSize(width: w, height: h)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let x = CGFloat(indexPath.row) * (itemWidth + space)
        let y = CGFloat(indexPath.section) + CGFloat(indexPath.section) * (itemHeight + space)
        attributes.frame = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)
        
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let minRow = (rect.origin.x > 0) ? Int(floor(rect.origin.x / (itemWidth + space))) : 0
        let maxRow = min(columns - 1, Int(ceil(rect.size.width / (itemWidth + space)) + CGFloat(minRow)))
        var attributes = [UICollectionViewLayoutAttributes]()
        
        for i in 0 ..< rows {
            for j in minRow ... maxRow {
                attributes.append(self.layoutAttributesForItem(at: IndexPath(item: j, section: i))!)
            }
        }
        
        return attributes
    }
}
