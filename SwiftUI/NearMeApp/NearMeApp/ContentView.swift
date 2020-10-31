//
//  ContentView.swift
//  NearMeApp
//
//  Created by Jaime Escobar on 11/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    private var locationManager = LocationManager()
    @State private var searchTerm: String = ""
    @State private var landmarks = [Landmark]()
    @State private var tapped: Bool = false
    
    private func searchLeadmarks() {
        guard let location = locationManager.location else { return }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response, error == nil else { return }
            let items = response.mapItems
            self.landmarks = items.map {
                Landmark(placemark: $0.placemark)
            }
        }
    }
    
    private func calculateOffset() -> CGFloat {
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.height / 4
        } else if tapped {
            return UIScreen.main.bounds.height * 2/3
        } else {
            return UIScreen.main.bounds.height
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            MapView(landmarks: self.landmarks).edgesIgnoringSafeArea(.all)
            TextField("Search", text: self.$searchTerm, onEditingChanged: {_ in }) {
                self.searchLeadmarks()
                }.textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            PlacesView(landmarks: self.landmarks) {
                tapped.toggle()
            }.animation(.spring())
            .offset(y: calculateOffset())
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
