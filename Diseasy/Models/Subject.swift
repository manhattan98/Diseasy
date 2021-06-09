//
//  Subject.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 08.06.2021.
//

import Foundation

typealias Location = (row: Int, column: Int)

class Subject {
    let location: Location
    var currentState: State
    
    init(location: Location) {
        self.location = location
        self.currentState = .Susceptible
    }
}
