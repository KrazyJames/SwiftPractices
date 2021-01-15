//
//  ContentView.swift
//  H4X0R
//
//  Created by Jaime Escobar on 05/05/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var manager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(manager.posts) { post in
                NavigationLink(destination: DetailView(urlString: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("News")
        }
        .onAppear{
            self.manager.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

