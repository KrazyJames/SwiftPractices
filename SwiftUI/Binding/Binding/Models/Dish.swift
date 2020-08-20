//
//  Dish.swift
//  Binding
//
//  Created by Jaime Escobar on 06/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import SwiftUI

struct Dish: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
    let isSpicy: Bool
}

extension Dish {
    func all() -> [Dish] {
        return [
            Dish(name: "Sushi", imageURL: "sushi", isSpicy: false),
            Dish(name: "Taco", imageURL: "taco", isSpicy: true),
            Dish(name: "Lasagna", imageURL: "lasagna", isSpicy: false),
            Dish(name: "Ramen", imageURL: "ramen", isSpicy: true)
        ]
    }
}
