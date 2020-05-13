//
//  CurrencyModel.swift
//  ByteCoin
//
//  Created by Jaime Escobar on 29/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CurrencyModel {
    let rate: Double
    let asset_id_quote: String
    
    var currencyString: String {
        return String(format: "%.3f", rate)
    }
    
    var currencyQuote: String{
        return asset_id_quote
    }
}
