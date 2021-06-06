//
//  SettingCompositeCell.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 03.06.2021.
//

import UIKit

class SettingCompositeCell: UITableViewCell {
    static let reusableIdentifier = "SettingCompositeCell"
    static let nibName = "SettingCompositeCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var titleText: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
