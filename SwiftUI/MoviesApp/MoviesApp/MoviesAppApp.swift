//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Jaime Escobar on 23/09/20.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    
    @StateObject var store = MovieStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
