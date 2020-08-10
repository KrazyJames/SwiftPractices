//
//  AddCoffeeOrderView.swift
//  CoffeeApp
//
//  Created by Jaime Escobar on 10/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeVM = AddCoffeeViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("INFO")) {
                        TextField("Enter name", text: self.$addCoffeeVM.name)
                    }
                    Section(header: Text("SELECT COFFEE")) {
                        ForEach(addCoffeeVM.list, id:\.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeVM.coffeeName)
                        }
                    }
                    Section(header: Text("SELECT SIZE"), footer: OrderTotalView(total: self.addCoffeeVM.total)) {
                        Picker("", selection: self.$addCoffeeVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                HStack {
                    Button("Place order") {
                        self.addCoffeeVM.placeOrder()
                        self.isPresented = false
                    }.foregroundColor(.white).padding(EdgeInsets(top: 10, leading: 100, bottom: 10, trailing: 100))
                    .background(Color.green)
                    .cornerRadius(10)
                }.padding(10)
            }
        .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 128, height: 128)
                .cornerRadius(16)
            Text(coffee.name).font(.headline).padding()
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }.padding(.vertical, 8)
    }
}

struct OrderTotalView: View {
    var total: Double
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "%.2f", self.total)).font(.title)
                .foregroundColor(.green)
            Spacer()
        }.padding()
    }
}

struct OrderTotalPreviews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 12.5)
    }
}
