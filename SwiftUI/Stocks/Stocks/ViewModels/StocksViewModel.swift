//
//  StocksViewModel.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

class StocksViewModel: ObservableObject {
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var searchTerm = ""
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        WebService().getStocks { stocks in
            if let stocks = stocks {
                self.stocks = stocks.map(StockViewModel.init)
            }
        }
    }
}


struct StockViewModel {
    let stock: Stock
    var symbol: String {
        return self.stock.symbol.uppercased()
    }
    var description: String {
        return self.stock.description
    }
    var price: String {
        return String(format: "%.2f", self.stock.price)
    }
    var change: String {
        return self.stock.change
    }
    var isNegative: Bool {
        return self.stock.change.starts(with: "-")
    }
}
