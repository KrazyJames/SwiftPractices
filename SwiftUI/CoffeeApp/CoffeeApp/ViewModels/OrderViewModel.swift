//
//  OrderViewModel.swift
//  CoffeeApp
//
//  Created by Jaime Escobar on 08/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

class OrderListViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        Service().getOrders { (orders) in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}

class OrderViewModel: Identifiable {
    
    let id = UUID()
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
    
    var size: String {
        return self.order.size
    }
    
    var total: Double {
        return self.order.total
    }
}
