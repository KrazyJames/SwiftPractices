//
//  WeatherModel.swift
//  Clima
//
//  Created by Jaime Escobar on 29/04/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionID:Int
    let temp: Double
    let cityName: String
    
    var tempString: String {
        return String(format: "%.0F",temp.rounded())
    }
    
    var conditionName: String {
        switch conditionID {
        case 200...202:
            return "cloud.bolt.rain"
        case 210:
            return "cloud.sun.bolt"
        case 211...221:
            return "cloud.bolt"
        case 230...232:
            return "cloud.bolt.rain"
            
        case 300...321:
            return "cloud.drizzle"
        case 500...501:
            return "cloud.sun.rain"
        case 502...504:
            return "cloud.rain"
        case 511:
            return "snow"
        case 520...531:
            return "cloud.heavyrain"
            
        case 600...602:
            return "snow"
        case 611...613:
            return "cloud.sleet"
        case 615...622:
            return "cloud.snow"
            
        case 700...711:
            return "smoke"
        case 721:
            return "sun.haze"
        case 731:
            return "sun.dust"
        case 741:
            return "cloud.fog"
        case 751...762:
            return "sun.dust"
        case 771:
            return "cloud.sun.rain"
        case 781:
            return "tornado"
            
        case 800:
            return "sun.max"
            
        case 801...802:
            return "cloud.sun"
        case 803...804:
            return "cloud"
            
        default:
            return "sun.min"
        }
    }
}
