//
//  PostData.swift
//  H4X0R
//
//  Created by Jaime Escobar on 05/05/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
