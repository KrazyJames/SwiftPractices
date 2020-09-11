//
//  Stock.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
