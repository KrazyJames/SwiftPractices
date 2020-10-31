//
//  MapView.swift
//  NearMeApp
//
//  Created by Jaime Escobar on 11/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    
    let landmarks: [Landmark]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
    
    typealias UIViewType = MKMapView
    
}

final class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationsView = views.first {
            if let annotation = annotationsView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}
