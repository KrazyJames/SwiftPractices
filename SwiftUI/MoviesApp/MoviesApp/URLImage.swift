//
//  ImageURL.swift
//  MoviesApp
//
//  Created by Jaime Escobar on 30/10/20.
//

import SwiftUI

struct URLImage: View {
    let url: String
    let placeholder: String
    @ObservedObject var imageLoader = ImageLoader()
    init(url: String, placeholder: String) {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image(placeholder).resizable()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "", placeholder: "")
    }
}
