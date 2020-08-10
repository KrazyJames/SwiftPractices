//
//  ContentView.swift
//  CoffeeApp
//
//  Created by Jaime Escobar on 08/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var listVM = OrderListViewModel()
    @State private var showModal: Bool = false
    var body: some View {
        NavigationView {
            OrdersView(orders: self.listVM.orders)
                .sheet(isPresented: $showModal, onDismiss: {
                    self.showModal = false
                }) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
            }
            .navigationBarTitle("Orders")
            .navigationBarItems(leading:
                Button(action: {
                    self.listVM.fetchOrders()
                }){
                Image(systemName: "arrow.clockwise")
                }, trailing:
                Button(action: {
                    self.showModal = true
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
