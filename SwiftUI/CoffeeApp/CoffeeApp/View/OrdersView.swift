//
//  OrdersView.swift
//  CoffeeApp
//
//  Created by Jaime Escobar on 08/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct OrdersView: View {
    var orders: [OrderViewModel]
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    var body: some View {
        List(orders) { order in
            HStack {
                Image(order.coffeeName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 128, height: 128)
                    .cornerRadius(16)
                VStack(alignment: .leading, spacing: 12) {
                    Text(order.name)
                        .font(.title)
                    Text(String(format: "$%.2f", order.total))
                        .foregroundColor(.green)
                        .font(.system(size: 20))
                        .bold()
                    HStack {
                        Text(order.coffeeName)
                            .font(.caption)
                            .padding(10)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        Text(order.size)
                            .font(.caption)
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView(orders: [OrderViewModel(order: Order(name: "Jaime", size: "Large", coffeeName: "Regular", total: 2.0))])
    }
}
