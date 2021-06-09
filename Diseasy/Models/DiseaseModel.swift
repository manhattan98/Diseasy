//
//  DiseaseModel.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 04.06.2021.
//

import Foundation

class DiseaseModel {
    let groupSize: Int
    let timePeriod: Float
    let infectionFactor: Int
    let incubationPeriod: Int
    let symptomsPeriod: Int
    
    var healthly: Int
    var infected: Int
    
    let contactRadius: Int = 1
    
    let subjectMatrix: [[Subject]]
        
    
    // MARK: - Init
    
    init(rows: Int, columns: Int, timePeriod: Float, infectionFactor: Int, incubationPeriod: Int, symptomsPeriod: Int) {
        self.groupSize = rows * columns
        self.timePeriod = timePeriod
        self.infectionFactor = infectionFactor
        self.incubationPeriod = incubationPeriod
        self.symptomsPeriod = symptomsPeriod
        
        self.healthly = groupSize
        self.infected = 0
        
        var subjectMatrix = [[Subject]](repeating: [Subject](), count: rows)
        for i in 0 ..< rows {
            for j in 0 ..< columns {
                let subject = Subject(location: (i, j))
                
                subjectMatrix[i].append(subject)
            }
        }
        
        self.subjectMatrix = subjectMatrix
    }
    
    /**
     automatically compute matrix dimensions so that difference between rows and columns will be minimum
     */
    convenience init(groupSize: Int, timePeriod: Float, infectionFactor: Int, incubationPeriod: Int, symptomsPeriod: Int) {
        var rows = Int(sqrt(Double(groupSize)))
        var columns = rows
        
        while rows * columns != groupSize {
            rows += 1
            columns = groupSize / rows
        }
        
        self.init(rows: rows, columns: columns, timePeriod: timePeriod, infectionFactor: infectionFactor, incubationPeriod: incubationPeriod, symptomsPeriod: symptomsPeriod)
    }
    
    
    // MARK: - Computation logic
    
    internal func getSubject(at location: Location) -> Subject? {
        guard location.row >= 0 && location.column >= 0 && location.row < subjectMatrix.count && location.column < subjectMatrix[0].count
        else { return nil }
        
        return subjectMatrix[location.row][location.column]
    }
    
    /**
     iterate all neighbours around subject in contact radius and return all susceptible
     */
    internal func getSusceptibleNeighbours(for subject: Subject) -> [Subject] {
        var susceptibleNeighbours = [Subject]()
        
        for i in subject.location.row - contactRadius ... subject.location.row + contactRadius {
            for j in subject.location.column - contactRadius ... subject.location.column + contactRadius {
                if let neighbour = getSubject(at: (i, j)) {
                    if neighbour.location != subject.location && neighbour.currentState == .Susceptible {
                        susceptibleNeighbours.append(neighbour)
                    }
                }
            }
        }
        
        return susceptibleNeighbours
    }
    
    /**
     distinct subject processing operation
     */
    func process(_ processed: Subject, changed changedSubjects: inout [Subject], queue: Queue<Subject>) {
        if processed.currentState != .Recovered { queue.add(processed) }
        
        // update statistics if processed itself became healthly
        else {
            healthly += 1
            infected -= 1
        }
        
        let previousState = processed.currentState
        
        processed.currentState = processed.currentState.nextState(
            incubationPeriod: incubationPeriod,
            symptomsPeriod: symptomsPeriod)
                            
        if previousState != processed.currentState { changedSubjects.append(processed) }
        
        // update statistics if processed itself became infected
        if previousState == .Susceptible {
            healthly -= 1
            infected += 1
        }
                    
        let susceptibles = getSusceptibleNeighbours(for: processed)
        
        guard susceptibles.count >= Defaults.infectionFactor.min else { return }

        let diseasedCount = Int.random(in: Defaults.infectionFactor.min ... min(infectionFactor, susceptibles.count))
        for bound in 0 ..< diseasedCount {
            let step = susceptibles.count / diseasedCount
            let randomIndex = Int.random(in: bound * step ..< (bound + 1) * step)
            
            let susceptible = susceptibles[randomIndex]
            
            susceptible.currentState = .InfectedIncubation(incubationPeriod)
            changedSubjects.append(susceptible)
            
            queue.add(susceptible)
            
            // update statistics because processed infected his neighbour
            healthly -= 1
            infected += 1
        }
    }
    
    
    // MARK: - Async computation
    
    let subjectQueue = Queue<Subject>()
    
    let stepBarrier = Subject(location: (-1, -1))
    
    let dispatchQueue = DispatchQueue(label: "DiseaseDispatchQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .inherit, target: DispatchQueue.global(qos: .userInitiated))
    
    let processingQueue = DispatchQueue(label: "DiseaseProcessingQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .inherit, target: DispatchQueue.global(qos: .userInitiated))
    
    
    func stepAsync(completionHandler callback: @escaping ([Subject]) -> Void) {
        dispatchQueue.async { [weak self] in
            var changed = [Subject]()
            
            // current processing has another subject to process and self is not nil
            while let processed = self?.subjectQueue.poll(), processed !== self!.stepBarrier {
                guard let self = self else { return }
                
                // run every subject in current processing as distinct async operation
                self.processingQueue.sync {
                    self.process(processed, changed: &changed, queue: self.subjectQueue)
                    //print("processed another subject")
                }
            }
            guard let self = self else { return }
                        
            self.subjectQueue.add(self.stepBarrier)
            DispatchQueue.main.async { callback(changed) }
        }
    }
    
    func processSubject(_ subject: Subject, completionHandler callback: @escaping ([Subject]) -> Void) {
        var changed = [Subject]()
        
        processingQueue.async { [self] in
            self.process(subject, changed: &changed, queue: self.subjectQueue)
                        
            //print(changed.count)
            
            DispatchQueue.main.async { callback(changed) }
        }
    }
    
}
