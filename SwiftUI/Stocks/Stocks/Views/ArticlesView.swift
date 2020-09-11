//
//  ArticlesView.swift
//  Stocks
//
//  Created by Jaime Escobar on 05/09/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ArticlesView: View {
    let articles: [ArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    init(articles: [ArticleViewModel], onDragBegin: @escaping (DragGesture.Value) -> Void, onDragEnd: @escaping (DragGesture.Value) -> Void) {
        self.articles = articles
        UITableView.appearance().backgroundColor = .clear // tableview background
        UITableViewCell.appearance().backgroundColor = .clear // cell background
        self.onDragBegin = onDragBegin
        self.onDragEnd = onDragEnd
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Bussines News").font(.system(size: 20)).bold().foregroundColor(.white)
                    Text("From News").font(.system(size: 16)).foregroundColor(Color.gray)
                }.padding()
                Spacer()
            }.contentShape(Rectangle())
                .gesture(DragGesture().onChanged(self.onDragBegin).onEnded(self.onDragEnd))
            List(self.articles, id: \.title) { article in
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(article.publication.uppercased()).font(.headline).bold()
                            .foregroundColor(Color.white)
                        Text(article.title).font(.subheadline).foregroundColor(Color.gray)
                    }
                    Spacer()
                    URLImage(url: article.imageURL, placeholder: "").scaledToFill().frame(width: 128, height: 128).cornerRadius(10)
                }
            }
        }.background(Color.init(red: 33/255, green: 33/255, blue: 33/255)).cornerRadius(20, corners: [.topLeft, .topRight])
    }
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "Some fake info here just for testing purposes", publication: "The Wall Street Journal", imageURL: "https://i.ytimg.com/vi/vbm3EXpUUcM/maxresdefault.jpg")
        return ArticlesView(articles: [ArticleViewModel(article: article)], onDragBegin: {_ in }, onDragEnd: {_ in })
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
