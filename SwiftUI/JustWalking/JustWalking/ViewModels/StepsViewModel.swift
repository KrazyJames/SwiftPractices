//
//  StepsViewModel.swift
//  JustWalking
//
//  Created by Jaime Escobar on 14/01/21.
//

import Foundation
import HealthKit

class StepsViewModel: ObservableObject {
    private var healthStore: HealthStore?
    @Published var steps: [StepsInfo] = []
    
    init() {
        healthStore = HealthStore()
    }
    
    func update(from statistics: HKStatisticsCollection) {
        let now = Date()
        guard let fromDate = Calendar.current.date(byAdding: .day, value: -7, to: now) else { return }
        statistics.enumerateStatistics(from: fromDate, to: now) { (statistics, stopPointer) in
            guard let count = statistics.sumQuantity()?.doubleValue(for: .count()) else { return }
            let step = StepsInfo(count: Int(count), date: statistics.startDate)
            self.steps.append(step)
        }
    }
    
    func requestAuth() {
        guard let store = self.healthStore else { return }
        store.requestAuth { authorized in
            if authorized {
                store.calculateSteps { statisticsCollection in
                    guard let collection = statisticsCollection else { return }
                    self.update(from: collection)
                }
            }
        }
    }
}
