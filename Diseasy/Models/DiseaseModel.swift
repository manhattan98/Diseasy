//
//  DiseaseModel.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 04.06.2021.
//

import Foundation

class DiseaseModel {
    typealias FloatValue = (default: Float, min: Float, max: Float)
    typealias IntValue = (default: Int, min: Int, max: Int)
    
    class Defaults {
        static let groupSize: IntValue = (25, 1, 250)
        static let timePeriod: FloatValue = (4, 1, 16)
        static let infectionFactor: IntValue = (3, 1, 4)
        static let incubationPeriod: FloatValue = (0.5, 0, 1)
        static let symptomsPeriod: FloatValue = (0.7, 0, 1)
        static let quarantineRate: FloatValue = (0.5, 0, 1)
    }
    
    class Subject {
        enum State {
            case Susceptible
            case InfectedIncubation
            case InfectedSymptoms
            case Recovered
            case Quarantined
        }
    }
    
}
