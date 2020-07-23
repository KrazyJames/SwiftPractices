//
//  Coordinator.swift
//  Practices
//
//  Created by Jaime Escobar on 15/07/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    var controls: MapView
    
    init(_ controls: MapView) {
        self.controls = controls
    }
}
