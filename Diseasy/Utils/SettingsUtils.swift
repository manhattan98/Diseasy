//
//  SettingsUtils.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 04.06.2021.
//

import Foundation

class SettingsUtils {
    class var groupSize: Int {
        get {
            return
                UserDefaults.standard.object(forKey: K.SETTING_GROUP_SIZE) as? Int ?? DiseaseModel.Defaults.groupSize.default
        } set {
            UserDefaults.standard.set(newValue, forKey: K.SETTING_GROUP_SIZE)
        }
    }
    
    class var timePeriod: Float {
        get {
            return UserDefaults.standard.object(forKey: K.SETTING_TIME_PERIOD) as? Float ?? DiseaseModel.Defaults.timePeriod.default
        } set {
            UserDefaults.standard.set(newValue, forKey: K.SETTING_TIME_PERIOD)
        }
    }
    
    class var infectionFactor: Int {
        get {
            return UserDefaults.standard.object(forKey: K.SETTING_INFECTION_FACTOR) as? Int ?? DiseaseModel.Defaults.infectionFactor.default
        }
        set {
            UserDefaults.standard.set(newValue, forKey: K.SETTING_INFECTION_FACTOR)
        }
    }
    
    class var incubationPeriod: Float {
        get {
            return UserDefaults.standard.object(forKey: K.SETTING_INCUBATION_PERIOD) as? Float ?? DiseaseModel.Defaults.incubationPeriod.default
        } set {
            UserDefaults.standard.set(newValue, forKey: K.SETTING_INCUBATION_PERIOD)
        }
    }
    
    class var symptomsPeriod: Float {
        get {
            return UserDefaults.standard.object(forKey: K.SETTING_SYMPTOMS_PERIOD) as? Float ?? DiseaseModel.Defaults.symptomsPeriod.default
        } set {
            UserDefaults.standard.set(newValue, forKey: K.SETTING_SYMPTOMS_PERIOD)
        }
    }
    
    class var quarantineRate: Float {
        get {
            return UserDefaults.standard.object(forKey: K.SETTING_QUARANTINE_RATE) as? Float ?? DiseaseModel.Defaults.quarantineRate.default
        } set {
            UserDefaults.standard.set(newValue, forKey: K.SETTING_QUARANTINE_RATE)
        }
    }
    
}
