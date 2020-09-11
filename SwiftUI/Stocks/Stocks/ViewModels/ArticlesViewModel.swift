//
//  ArticlesViewModel.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class ArticlesViewModel: ObservableObject {
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 0)
    @Published var articles: [ArticleViewModel] = [ArticleViewModel]()
    
    func load() {
        fetchNews()
    }
    
    private func fetchNews() {
        WebService().getNews { articles in
            if let articles = articles {
                self.articles = articles.map(ArticleViewModel.init)
            }
        }
    }
}

struct ArticleViewModel {
    let article: Article
    var title: String {
        return self.article.title
    }
    var publication: String {
        return self.article.publication
    }
    var imageURL: String {
        return self.article.imageURL
    }
}
