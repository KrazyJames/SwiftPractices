//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Jaime Escobar on 18/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var ordersVM = OrdersViewModel()
    @State var isPresented: Bool = false
    private func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let orderVM = self.ordersVM.orders[index]
            self.ordersVM.deleteOrder(orderVM)
        }
    }
    var body: some View {
        NavigationView {
            List() {
                ForEach(self.ordersVM.orders, id: \.name) { order in
                    HStack {
                        Image(order.type)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 128, height: 128, alignment: .center)
                            .cornerRadius(8)
                        VStack {
                            Text(order.name).font(.system(.title))
                        }
                    }
                }.onDelete { index in
                    self.delete(at: index)
                }
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                self.ordersVM.fetchOrders()
            }){
                AddOrderView(isPresented: self.$isPresented)
            }
            .navigationBarTitle("Orders", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.isPresented.toggle()
            }){
                Image(systemName: "plus")
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
