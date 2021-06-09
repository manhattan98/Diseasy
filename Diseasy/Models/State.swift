//
//  State.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 08.06.2021.
//

import Foundation

enum State: Equatable {
    static func == (lhs: State, rhs: State) -> Bool {
        switch (lhs, rhs) {
        case (.Susceptible, .Susceptible),
             (.InfectedIncubation(_), .InfectedIncubation(_)),
             (.InfectedSymptoms(_), .InfectedSymptoms(_)),
             (.Recovered, .Recovered):
            return true
        default:
            return false
        }
    }
    
    case Susceptible
    case InfectedIncubation(Int)
    case InfectedSymptoms(Int)
    case Recovered
    
    func nextState(incubationPeriod: Int, symptomsPeriod: Int) -> State {
        switch self {
        case .Susceptible:
            return .InfectedIncubation(incubationPeriod)
        case .InfectedIncubation(let estimated):
            return estimated > 0 ? .InfectedIncubation(estimated - 1) : .InfectedSymptoms(symptomsPeriod)
        case .InfectedSymptoms(let estimated):
            return estimated > 0 ? .InfectedSymptoms(estimated - 1) : .Recovered
        case .Recovered:
            return .Recovered
        }
    }
}
