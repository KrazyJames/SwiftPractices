//
//  SearchView.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchTerm: String
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            TextField("Search", text: self.$searchTerm).foregroundColor(Color.primary).padding(10)
            Spacer()
        }.foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}
