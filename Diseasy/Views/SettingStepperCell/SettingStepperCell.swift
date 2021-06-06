//
//  SettingStepperCell.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 03.06.2021.
//

import UIKit

class SettingStepperCell: UITableViewCell {
    static let reusableIdentifier = "SettingStepperCell"
    static let nibName = "SettingStepperCell"

    @IBOutlet weak internal var stepper: UIStepper!
    @IBOutlet weak internal var valueLabel: UILabel!
    @IBOutlet weak internal var titleLabel: UILabel!
    @IBOutlet weak internal var descriptionLabel: UILabel!
    
    
    var settingItem: SettingItem.SettingStepperItem? {
        didSet {
            if let item = settingItem {
                formatter.maximumFractionDigits = item.fractionDigits
                formatter.minimumFractionDigits = item.fractionDigits
                stepper.minimumValue = item.min
                stepper.maximumValue = item.max
                stepper.stepValue = item.step
                stepper.value = item.getValue()
                stepperValueChanged(stepper)
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
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        valueLabel.text = formatter.string(from: NSNumber(value: sender.value))
        
        settingItem?.setValue(sender.value)
    }
    
}
