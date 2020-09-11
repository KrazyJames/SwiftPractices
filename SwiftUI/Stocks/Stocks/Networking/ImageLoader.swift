//
//  ImageLoader.swift
//  Stocks
//
//  Created by Jaime Escobar on 06/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
