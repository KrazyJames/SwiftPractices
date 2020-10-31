//
//  Movie.swift
//  MoviesApp
//
//  Created by Jaime Escobar on 23/09/20.
//

import Foundation

struct Movie: Decodable {
    let imdbID: String
    let title: String
    let poster: String
    let year: String
    let duration: String?
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case poster = "Poster"
        case year = "Year"
        case duration = "Runtime"
        case description = "Plot"
    }
}

struct MovieResponse: Decodable {
    let movies: [Movie]?
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

class MovieStore: ObservableObject {
    @Published var movies: [Movie]? = [Movie]()
    
    func getAll() {
        guard let url = URL(string: "http://www.omdbapi.com/?s=Spider-man&apikey=7cd791d") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse = movieResponse {
                DispatchQueue.main.async {
                    if let movies = movieResponse.movies {
                        self.movies = movies
                    } else {
                        print("failed")
                        return
                    }
                }
            }
        }.resume()
    }
}

class MovieDetail: ObservableObject {
    @Published var movie: Movie?
    
    func getDetail(imdbID: String) {
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbID)&apikey=7cd791d") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            let movieResponse = try? JSONDecoder().decode(Movie.self, from: data)
            DispatchQueue.main.async {
                self.movie = movieResponse
            }
        }.resume()
    }
}
