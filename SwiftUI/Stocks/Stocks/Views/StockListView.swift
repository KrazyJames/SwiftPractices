//
//  StockListView.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct StockListView: View {
    let stocks: [StockViewModel]
    var body: some View {
        List(self.stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "GOOG", description: "Google", price: 1000, change: "-1.29")
        return StockListView(stocks: [StockViewModel(stock: stock)])
    }
}
