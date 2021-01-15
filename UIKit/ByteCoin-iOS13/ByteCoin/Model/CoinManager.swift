//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CurrencyManagerDelegate {
    func didUpdateCurrency(_ manager: CoinManager, currency: CurrencyModel)
    func didFailCoin(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "23391223-D08A-422B-A4DD-35D0F0D39B56"
    var delegate: CurrencyManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data,response,error) in
                if error != nil{
                    return
                }
                if let safeData = data {
                    if let currency = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCurrency(self, currency: currency)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CurrencyModel? {
        let decoder = JSONDecoder()
        do{
            let res = try decoder.decode(CurrencyData.self, from: data)
            let rate = res.rate
            let quote = res.asset_id_quote
            let currencyModel = CurrencyModel(rate: rate, asset_id_quote: quote)
            return currencyModel
        }catch{
            delegate?.didFailCoin(error)
            return nil
        }
    }
}
