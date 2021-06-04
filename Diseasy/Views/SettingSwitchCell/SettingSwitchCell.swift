//
//  SettingSwitchCell.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 03.06.2021.
//

import UIKit

class SettingSwitchCell: UITableViewCell {
    static let reusableIdentifier = "SettingSwitchCell"

    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var settingItem: SettingItem.SettingSwitchItem? {
        didSet {
            if let item = settingItem {
                `switch`.setOn(item.getValue(), animated: false)
                titleLabel.text = item.title
                descriptionLabel.text = item.description
            }
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
    
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        settingItem?.setValue(sender.isOn)
    }
    
}
