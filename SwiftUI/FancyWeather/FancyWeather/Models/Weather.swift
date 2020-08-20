//
//  Weather.swift
//  FancyWeather
//
//  Created by Jaime Escobar on 08/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
