//
//  WebService.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

class WebService {
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL incorrect")
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            DispatchQueue.main.async {
                completion(stocks)
            }
        }.resume()
    }
    
    func getNews(completion: @escaping (([Article]?)->Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("URL incorrect")
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
        }.resume()
    }
}
