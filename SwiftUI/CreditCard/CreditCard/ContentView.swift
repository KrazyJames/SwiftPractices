//
//  ContentView.swift
//  CreditCard
//
//  Created by Jaime Escobar on 28/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    
    @State private var number: String = ""
    @State private var name: String = ""
    @State private var expiration: String = ""
    @State private var cvv: String = ""
    var body: some View {
        NavigationView {
            VStack {
                CreditCardView {
                    VStack {
                        Group {
                            if !flipped {
                                FrontCard(number: number, holder: name, expiration: expiration)
                            } else {
                                BackCard(cvv: cvv)
                            }
                        }
                    }.rotation3DEffect(
                        .degrees(degrees),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                }.frame(height: 250)
                
                VStack {
                    TextField("Number", text: $number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Expiration date", text: $expiration)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("CVV", text: $cvv) { edited in
                        withAnimation {
                            flipped.toggle()
                            degrees+=180
                        }
                    } onCommit: {}
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Check Out")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
