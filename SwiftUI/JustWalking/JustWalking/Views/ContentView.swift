//
//  ContentView.swift
//  JustWalking
//
//  Created by Jaime Escobar on 14/01/21.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
    private var healthStore: HealthStore?
    @State var steps: [StepsInfo] = []
    
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
    
    var body: some View {
        NavigationView {
            List(steps, id: \.id) { step in
                VStack(alignment: .leading) {
                    Text("\(step.count)")
                    Text(step.date, style: .date).opacity(0.5)
                }
            }
            .navigationTitle("JustWalking")
        }
        .onAppear {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
