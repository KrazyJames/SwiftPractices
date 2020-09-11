//
//  ContentView.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stocksVM = StocksViewModel()
    @ObservedObject var articlesVM = ArticlesViewModel()
    @State var isExpanded = false
    init() {
        self.stocksVM.load()
        self.articlesVM.load()
        self.articlesVM.dragOffset = CGSize(width: 0, height: UIScreen.main.bounds.height * 4/5)
    }
    var body: some View {
        let filteredStocks = self.stocksVM.searchTerm.isEmpty ? self.stocksVM.stocks : self.stocksVM.stocks.filter({$0.symbol.starts(with: self.stocksVM.searchTerm.uppercased())})
        return NavigationView {
            ZStack {
                List {
                    SearchView(searchTerm: self.$stocksVM.searchTerm)
                    ForEach(filteredStocks, id: \.symbol) { stock in
                        StockCellView(stock: stock)
                    }
                }
                ArticlesView(articles: self.articlesVM.articles, onDragBegin: { value in
                    self.articlesVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    if value.translation.height < 0 {
                        self.articlesVM.dragOffset = CGSize(width: 0, height: 64)
                    } else {
                        self.articlesVM.dragOffset = CGSize(width: 0, height: UIScreen.main.bounds.height * 4/5)
                    }
                }).offset(y: self.articlesVM.dragOffset.height).animation(.spring())
            }
            .navigationBarItems(leading: VStack(alignment: .leading) {
                Text("Stonks").font(.system(size: 20)).fontWeight(.bold)
                Text("January 21").font(.headline).foregroundColor(.secondary).fontWeight(.bold)
            }, trailing: Button("Edit") {
                self.isExpanded.toggle()
            })
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.dark)
    }
}
