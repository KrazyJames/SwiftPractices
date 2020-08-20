//
//  WeatherService.swift
//  FancyWeather
//
//  Created by Jaime Escobar on 08/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

class WeatherService {
    let appKey = "317b948d1c4304a18e6ff1a384256a7b"
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(appKey)&units=metric") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            if let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
                return
            }
        }.resume()
    }
}
