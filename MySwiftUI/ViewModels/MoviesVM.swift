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
    @Published var genres:[Genre]
    
    init(movies:[Movie] = [], genres: [Genre] = []) {
        self.movies = movies
        self.genres = genres
    }
    
    @MainActor func getMovies() async {
        do {
            async let genresTask = persistence.getGenres()
            async let moviesTask = persistence.getNowPlaying()
            (genres, movies) = try await (genresTask, moviesTask)
        } catch {
            // Surface error to UI or log for analytics
            // Example: add an @Published var error: Error? and set it here
            // error = error
            print("Error fetching movies: \(error.localizedDescription)")
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
