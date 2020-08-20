//
//  NSManagerObjectContext+Extensions.swift
//  CoffeeShop
//
//  Created by Jaime Escobar on 18/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
}
