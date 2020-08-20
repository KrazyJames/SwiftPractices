//
//  AddOrderViewModel.swift
//  CoffeeShop
//
//  Created by Jaime Escobar on 18/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

class AddOrderViewModel {
    
    var name: String = ""
    var type: String = ""
    
    func saveOrder() {
        CoreDataManager.shared.save(name: self.name, type: self.type)
    }
}
