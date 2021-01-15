//
//  LocationManager.swift
//  Practices
//
//  Created by Jaime Escobar on 15/07/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import CoreLocation
class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
}
