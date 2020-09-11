//
//  Article.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let title: String
    let publication: String
    let imageURL: String
}
