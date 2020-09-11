//
//  StockCell.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct StockCellView: View {
    var stock: StockViewModel
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(self.stock.symbol).font(.headline)
                Text(self.stock.description).foregroundColor(Color.secondary)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                Text(self.stock.price)
                Text(self.stock.change).padding(5).foregroundColor(Color.white).background(self.stock.isNegative ? Color.red : Color.green).cornerRadius(10)
            }
        }
    }
}

struct StockCellView_Previews: PreviewProvider {
    static var previews: some View {
        StockCellView(stock: StockViewModel(stock: Stock(symbol: "GOOG", description: "Google", price: 1000, change: "1.29")))
    }
}
