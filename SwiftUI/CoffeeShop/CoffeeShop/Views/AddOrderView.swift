//
//  AddOrderView.swift
//  CoffeeShop
//
//  Created by Jaime Escobar on 18/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
    @Binding var isPresented: Bool
    @State private var vm = AddOrderViewModel()
    var body: some View {
        NavigationView {
            VStack {
                TextField("Insert name", text: self.$vm.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Picker(selection: self.$vm.type, label: Text("")) {
                    Text("Cappuccino").tag("cap")
                    Text("Regular").tag("reg")
                    Text("Expresso").tag("exp")
                }.pickerStyle(SegmentedPickerStyle())
                Button("Order") {
                    self.vm.saveOrder()
                    self.isPresented.toggle()
                }
                .foregroundColor(.white)
                .padding(8)
                .background(Color.blue)
                .cornerRadius(8)
                Spacer()
            }.padding()
            .navigationBarTitle("Order", displayMode: .inline)
        }
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}


