//
//  CurrencyData.swift
//  ByteCoin
//
//  Created by Jaime Escobar on 29/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CurrencyData: Codable {
    let rate: Double
    let asset_id_quote: String
}
