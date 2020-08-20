//
//  OrdersViewModel.swift
//  CoffeeShop
//
//  Created by Jaime Escobar on 18/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class OrdersViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func deleteOrder(_ orderVM: OrderViewModel) {
        CoreDataManager.shared.delete(name: orderVM.name)
        fetchOrders()
    }
    
    func fetchOrders() {
        self.orders = CoreDataManager.shared.fetch().map(OrderViewModel.init)
        print(orders[0].type)
    }
}

class OrderViewModel {
    var name: String
    var type: String
    
    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
}
