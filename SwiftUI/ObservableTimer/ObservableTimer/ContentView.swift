//
//  ContentView.swift
//  ObservableTimer
//
//  Created by Jaime Escobar on 07/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var timer: FancyTimer
    var body: some View {
        VStack {
            Text("\(timer.value)")
                .font(.largeTitle)
            Button("Reset") {
                self.timer.value = 0
            }
            .padding()
            FancyScoreView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FancyTimer())
    }
}

import Combine

class FancyTimer: ObservableObject {
    @Published var value: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
        }
    }
}
