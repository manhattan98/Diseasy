//
//  SettingItem.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 03.06.2021.
//

import Foundation

class SettingItem {
    let title: String?
    let description: String?
        
    internal init(title: String?, description: String?) {
        self.title = title
        self.description = description
    }
    
    class SettingSliderItem: SettingItem {
        let min: Float
        let max: Float
        
        let showValue: Bool
        
        let fractionDigits: Int
        
        let getValue: () -> Float
        let setValue: (Float) -> Void
        
        init(get: @escaping () -> Float, set: @escaping (Float) -> Void, title: String?, description: String?, min: Float, max: Float, fractionDigits: Int, showValue: Bool) {
            self.min = min
            self.max = max
            
            self.showValue = showValue
            
            self.fractionDigits = fractionDigits
            
            self.getValue = get
            self.setValue = set
            
            super.init(title: title, description: description)
        }
    }
    
    class SettingStepperItem: SettingItem {
        let min: Double
        let max: Double
        
        let step: Double
        
        let fractionDigits: Int
        
        let getValue: () -> Double
        let setValue: (Double) -> Void
        
        init(get: @escaping () -> Double, set: @escaping (Double) -> Void, title: String?, description: String?, min: Double, max: Double, step: Double, fractionDigits: Int) {
            self.min = min
            self.max = max
            
            self.step = step
            
            self.fractionDigits = fractionDigits
            
            self.getValue = get
            self.setValue = set
            
            super.init(title: title, description: description)
        }
    }
    
    class SettingSwitchItem: SettingItem {
        let getValue: () -> Bool
        let setValue: (Bool) -> Void
        
        init(get: @escaping () -> Bool, set: @escaping (Bool) -> Void, title: String?, description: String?) {
            self.getValue = get
            self.setValue = set
            
            super.init(title: title, description: description)
        }
    }
    
}
