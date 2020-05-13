//
//  DetailView.swift
//  H4X0R
//
//  Created by Jaime Escobar on 05/05/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var urlString: String?
    var body: some View {
        WebView(urlString: urlString)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(urlString: "google.com")
    }
}
