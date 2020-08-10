//
//  Order.swift
//  CoffeeApp
//
//  Created by Jaime Escobar on 08/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

struct Order: Codable {
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
