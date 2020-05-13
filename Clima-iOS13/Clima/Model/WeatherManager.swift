//
//  WeatherManager.swift
//  Clima
//
//  Created by Jaime Escobar on 29/04/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ manager: WeatherManager, weather: WeatherModel)
    func didFailWeather(_ error: Error)
}

struct WeatherManager {
    var units: String = "metric"
    let baseUrl = "https://api.openweathermap.org/data/2.5/weather?appid=317b948d1c4304a18e6ff1a384256a7b"
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(cityName: String) {
        let city = cityName.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let url = "\(baseUrl)&q=\(city)&units=\(units)"
        self.performRequest(with: url)
    }
    
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let url = "\(baseUrl)&lat=\(lat)&lon=\(lon)&units=\(units)"
        self.performRequest(with: url)
    }
    
    func performRequest(with urlString: String){
        //Create the url if not empty
        if let url = URL(string: urlString){
            //Create the session
            let session = URLSession(configuration: .default)
            //Give the session a task
            let task = session.dataTask(with: url){ (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWeather(error!)
                    return
                }
                if let safeData = data{
                    if let weather = self.parseJSON(data: safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //Start the task
            task.resume()
        }
    }
    
    func parseJSON(data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let res = try decoder.decode(WeatherData.self, from: data)
            let name = res.name
            let temp = res.main.temp
            let id = res.weather[0].id
            let weather = WeatherModel(conditionID: id, temp: temp, cityName: name)
            return weather
        }catch{
            delegate?.didFailWeather(error)
            return nil
        }
    }
}
