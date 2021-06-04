//
//  SettingSliderCell.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 03.06.2021.
//

import UIKit

class SettingSliderCell: UITableViewCell {
    static let reusableIdentifier = "SettingSliderCell"

    @IBOutlet weak internal var slider: UISlider!
    @IBOutlet weak internal var valueLabel: UILabel!
    @IBOutlet weak internal var titleLabel: UILabel!
    @IBOutlet weak internal var descriptionLabel: UILabel!
    
    
    var settingItem: SettingItem.SettingSliderItem? {
        didSet {
            if let item = settingItem {
                formatter.maximumFractionDigits = item.fractionDigits
                formatter.minimumFractionDigits = item.fractionDigits
                slider.minimumValue = item.min
                slider.maximumValue = item.max
                slider.setValue(item.getValue(), animated: false)
                sliderValueChanged(slider)
                titleLabel.text = item.title
                descriptionLabel.text = item.description
            }
        }
    }
    

    internal let formatter = NumberFormatter()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        formatter.roundingMode = .down
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        valueLabel.text = settingItem?.showValue ?? false ? formatter.string(from: NSNumber(value: sender.value)) : nil
                
        settingItem?.setValue(sender.value)
    }
    
    
}
