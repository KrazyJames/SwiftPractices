//
//  MapViewView.swift
//  Practices
//
//  Created by Jaime Escobar on 15/07/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct MapViewView: View {
    @State private var fullScreen = false
    var location = LocationManager()
    var body: some View {
        NavigationView {
            MapView().edgesIgnoringSafeArea(.vertical)
            .navigationBarTitle("MapView", displayMode: .inline)
        }
    }
}

struct MapViewView_Previews: PreviewProvider {
    static var previews: some View {
        MapViewView()
    }
}
