//
//  Defaults.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 08.06.2021.
//

import Foundation

class Defaults {
    typealias ValueDefaults<T: Comparable> = (default: T, min: T, max: T)
    
    static let groupSize: ValueDefaults<Int> = (default: 100, min: 25, max: 2500)
    static let timePeriod: ValueDefaults<Float> = (default: 1.0, min: 0.1, max: 4.0)
    static let infectionFactor: ValueDefaults<Int> = (default: 3, min: 0, max: 8)
    static let incubationPeriod: ValueDefaults<Int> = (default: 7, min: 1, max: 20)
    static let symptomsPeriod: ValueDefaults<Int> = (default: 8, min: 1, max: 20)
}
