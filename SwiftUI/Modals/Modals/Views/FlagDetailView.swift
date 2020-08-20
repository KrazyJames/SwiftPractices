//
//  FlagDetailView.swift
//  Modals
//
//  Created by Jaime Escobar on 17/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct FlagDetailView: View {
    @Binding var country: Country
    @Binding var showModal: Bool
    @State private var name: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Which country is this flag from?").font(.title).multilineTextAlignment(.center).padding()
                Text(self.country.flag).font(.system(size: 100))
                TextField("Insert country name", text: self.$name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .navigationBarTitle(Text("Country name"), displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                self.country.name = self.name
                self.showModal.toggle()
            })
        }
    }
}

struct FlagDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailView(country: .constant(Country(name: "USA", flag: "🇺🇸")),showModal: .constant(true))
    }
}
