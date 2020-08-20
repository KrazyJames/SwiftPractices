//
//  Country.swift
//  Modals
//
//  Created by Jaime Escobar on 17/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

struct Country: Hashable {
    var name: String
    var flag: String
}

extension Country {
    static func all() -> [Country] {
        return [
            Country(name: "", flag: "🇨🇦"),
            Country(name: "", flag: "🇨🇱"),
            Country(name: "", flag: "🇯🇵"),
            Country(name: "", flag: "🇳🇬"),
            Country(name: "", flag: "🇷🇺"),
            Country(name: "", flag: "🇺🇸")
        ]
    }
}
