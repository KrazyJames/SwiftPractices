//
//  Lendmark.swift
//  NearMeApp
//
//  Created by Jaime Escobar on 11/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import MapKit

struct Landmark {
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}

final class LandmarkAnnotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
