//
//  WebView.swift
//  H4X0R
//
//  Created by Jaime Escobar on 05/05/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString{
            if let url = URL(string: safeUrl){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
