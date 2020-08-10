//
//  CoffeeViewModel.swift
//  CoffeeApp
//
//  Created by Jaime Escobar on 10/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

class CoffeeViewModel {
    
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        self.coffee.name
    }
    
    var imageURL: String{
        self.coffee.imageURL
    }
    
    var price: Double {
        self.coffee.price
    }
}

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}
