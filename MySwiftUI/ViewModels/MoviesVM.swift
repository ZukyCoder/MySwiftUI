//
//  MoviesVM.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 21/10/2022.
//

import SwiftUI

final class MoviesVM:ObservableObject {
    let persistence = NetworkPersistence.share
    
    @Published var movies:[Movie]
    @Published var genres:[Genre] = []
    
    init(movies:[Movie] = []){
        self.movies = movies
    }
    
    @MainActor func getMovies() async {
        do {
            async let genresTask = persistence.getGeners()
            async let moviesTask = persistence.getNowPlaying()
            (genres, movies) = try await (genresTask, moviesTask)
        } catch {
            print("Error \(error)")
        }
    }
    
    func getGenre(generos:[Int]) -> String {
        String(generos
            .compactMap { genre in
            genres.first {
                $0.id == genre
            }?.name
        }
            .joined(separator: ", "))
    }
}
