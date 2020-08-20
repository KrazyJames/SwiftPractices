//
//  WeatherViewModel.swift
//  FancyWeather
//
//  Created by Jaime Escobar on 08/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weather = Weather()
    private var service: WeatherService!
    
    var temperature: String {
        if let temp = weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let hum = weather.humidity {
            return String(format: "%.0f", hum)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    init() {
        service = WeatherService()
    }
    
    func search() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        service.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
}
