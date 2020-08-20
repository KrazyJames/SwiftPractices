//
//  ContentView.swift
//  Modals
//
//  Created by Jaime Escobar on 17/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var flagViewModel = FlagViewModel(countries: Country.all())
    @State private var index: Int = 0
    var body: some View {
        NavigationView {
            List(0..<self.flagViewModel.countries.count) { index in
                HStack {
                    Text(self.flagViewModel.countries[index].flag).font(.system(size: 50))
                    Text(self.flagViewModel.countries[index].name)
                    Spacer()
                }.onTapGesture {
                    self.index = index
                    self.flagViewModel.showModal.toggle()
                }.sheet(isPresented: self.$flagViewModel.showModal) {
                    FlagDetailView(country: self.$flagViewModel.countries[self.index], showModal: self.$flagViewModel.showModal)
                }
            }
            .navigationBarTitle("Flag countries", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
