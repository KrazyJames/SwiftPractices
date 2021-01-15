//
//  ContentView.swift
//  JustWalking
//
//  Created by Jaime Escobar on 14/01/21.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    @AppStorage("stepCount", store: UserDefaults(suiteName: "group.com.kj.JustWalking"))
    var stepCount: Int = 0
    
    @State var steps: Int?
    @State var distance: Double?
    
    private var pedometer = CMPedometer()
    
    private var isAvailable: Bool {
        return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.isStepCountingAvailable()
    }
    
    var body: some View {
        VStack {
            Text(steps != nil ? "\(steps!) steps" : "0 steps")
                .padding()
            Text(distance != nil ? String(format: "%.2f km", distance!) : "0 km")
                .padding()
                
            }
        .onAppear {
                initPedometer()
        }
    }
    
    private func initPedometer() {
        if isAvailable {
            let now = Date()
            guard let from = Calendar.current.date(byAdding: .day, value: -7, to: now) else { return }
            pedometer.queryPedometerData(from: from, to: now) { (data, error) in
                guard let data = data, error == nil else { return }
                updateUI(data: data)
            }
        }
    }
    
    private func updateUI(data: CMPedometerData) {
        steps = data.numberOfSteps.intValue
        stepCount = data.numberOfSteps.intValue
        guard let dataDistance = data.distance else { return }
        let distanceInMeters = Measurement(value: dataDistance.doubleValue, unit: UnitLength.meters)
        let distanceInKm = distanceInMeters.converted(to: .kilometers)
        distance = distanceInKm.value
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
