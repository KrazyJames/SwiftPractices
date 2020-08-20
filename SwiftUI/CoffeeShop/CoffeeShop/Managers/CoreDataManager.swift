//
//  CoreDataManager.swift
//  CoffeeShop
//
//  Created by Jaime Escobar on 18/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    private var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func fetch() -> [Order] {
        var orders = [Order]()
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        do {
            orders = try moc.fetch(request)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return orders
    }
    
    private func fetchOrder(name: String) -> Order? {
        var orders = [Order]()
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        do {
            orders = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return orders.first
    }
    
    func delete(name: String) {
        do {
            if let order = fetchOrder(name: name) {
                self.moc.delete(order)
                try self.moc.save()
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func save(name: String, type: String) {
        let order = Order(context: moc)
        order.name = name
        order.type = type
        do {
            try moc.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
