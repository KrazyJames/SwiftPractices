//
//  AddCoffeeViewModel.swift
//  CoffeeApp
//
//  Created by Jaime Escobar on 10/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

class AddCoffeeViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    var service: Service
    
    init() {
        self.service = Service()
    }
    
    var list: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calcTotal()
    }
    
    private func sizePrice() -> Double {
        let prices = ["Small":1.0,"Medium":1.25,"Large":1.75]
        return prices[self.size]!
    }
    
    func calcTotal() -> Double {
        let coffeeVM = list.first { $0.name == coffeeName }
        if let vm = coffeeVM {
            return vm.price * sizePrice()
        } else {
            return 0.0
        }
    }
    
    func placeOrder() {
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        self.service.createOrder(order: order) { _ in
            print("Todo")
        }
    }
    
}
