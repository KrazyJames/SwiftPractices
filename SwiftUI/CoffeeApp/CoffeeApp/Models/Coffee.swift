//
//  Coffee.swift
//  CoffeeApp
//
//  Created by Jaime Escobar on 08/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Coffee(name: "Expresso", imageURL: "Expresso", price: 1.8),
            Coffee(name: "Regular", imageURL: "Regular", price: 1.2)
        ]
    }
}
