//
//  Report.swift
//  Shapes
//
//  Created by Jaime Escobar on 14/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

struct Report: Hashable {
    let year: String
    let revenue: Double
}

extension Report {
    static func all() -> [Report] {
        return [
            Report(year: "2011", revenue: 35000),
            Report(year: "2012", revenue: 55000),
            Report(year: "2013", revenue: 45000)
        ]
    }
}
