//
//  PlacesView.swift
//  NearMeApp
//
//  Created by Jaime Escobar on 17/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI
import MapKit

struct PlacesView: View {
    let landmarks: [Landmark]
    var onTap: () -> ()
    var body: some View {
        VStack {
            HStack {
                EmptyView()
            }.frame(width: UIScreen.main.bounds.width, height: 32).background(Color.primary).gesture(TapGesture().onEnded(self.onTap))
            List(self.landmarks, id: \.id) { landmark in
                Text(landmark.name)
            }
        }.cornerRadius(16)
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
