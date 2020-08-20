//
//  ContentView.swift
//  Shapes
//
//  Created by Jaime Escobar on 14/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Spacer()
                Text("Revenue").font(.title)
                BarGraph(reports: Report.all())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
