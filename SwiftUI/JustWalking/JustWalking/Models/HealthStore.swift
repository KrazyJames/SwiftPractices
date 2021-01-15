//
//  HealthStore.swift
//  JustWalking
//
//  Created by Jaime Escobar on 14/01/21.
//

import Foundation
import HealthKit

class HealthStore {
    var healtStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healtStore = HKHealthStore()
        }
    }
    
    func calculateSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        guard let type = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return completion(nil) }
        let now = Date()
        let fromDate = Calendar.current.date(byAdding: .day, value: -7, to: now)
        guard let anchorDate = Date.monday12AM() else { return completion(nil) }
        let daily = DateComponents(day: 1)
        let predicate = HKQuery.predicateForSamples(withStart: fromDate, end: now, options: .strictStartDate)
        let query = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        query.initialResultsHandler = { query, statistics, error in
            completion(statistics)
        }
        guard let store = healtStore else { return completion(nil) }
        store.execute(query)
    }
    
    func requestAuth(completion: @escaping (Bool) -> Void) {
        guard let type = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return completion(false) }
        guard let store = healtStore else { return completion(false) }
        store.requestAuthorization(toShare: [], read: [type]) { (succed, error) in
            completion(succed)
        }
    }
}

extension Date {
    static func monday12AM() -> Date? {
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))
    }
}
