//
//  ContentView.swift
//  JustWalking
//
//  Created by Jaime Escobar on 14/01/21.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
    @ObservedObject var viewModel = StepsViewModel()
    
    var body: some View {
        NavigationView {
            GraphView(list: viewModel.steps)
            .navigationTitle("JustWalking")
        }
        .onAppear {
            viewModel.requestAuth()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
