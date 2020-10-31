//
//  ContentView.swift
//  MoviesApp
//
//  Created by Jaime Escobar on 23/09/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: MovieStore
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(store.movies ?? [Movie](), id: \.imdbID) { movie in
                        NavigationLink(
                            destination: DetailView(movieID: movie.imdbID)) {
                            PosterView(movie: movie)
                        }
                    }
                }
            }
            .navigationTitle("Movies")
        }
        .onAppear(perform: {
            store.getAll()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: MovieStore())
            
    }
}

struct PosterView: View {
    var movie: Movie
    var body: some View {
        VStack(alignment: .center) {
            URLImage(url: movie.poster, placeholder: "").frame(width: 100, height: 150, alignment: .center)
            Text(movie.title).frame(maxWidth: 100, maxHeight: .infinity, alignment: .top).multilineTextAlignment(.center)
        }
    }
}

struct DetailView: View {
    @ObservedObject var movie = MovieDetail()
    init(movieID: String) {
        movie.getDetail(imdbID: movieID)
    }
    var height = UIScreen.main.bounds.height/2
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                URLImage(url: movie.movie?.poster ?? "", placeholder: "").scaledToFill()
                Text(movie.movie?.title ?? "Ups").font(.title).padding()
                Text(movie.movie?.description ?? "We cant find this film").padding()
                Spacer()
            }
            .navigationBarTitle(Text(movie.movie?.title ?? "Not found"), displayMode: .inline)
        }
    }
}
