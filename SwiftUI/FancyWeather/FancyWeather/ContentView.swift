//
//  ContentView.swift
//  FancyWeather
//
//  Created by Jaime Escobar on 08/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    init() {
        self.weatherVM = WeatherViewModel()
    }
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter city", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
                }.font(.system(size: 50)).padding()
            Text(self.weatherVM.temperature)
                .font(.system(size: 100))
                .foregroundColor(.white).padding()            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
