//
//  MoviesVM.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 21/10/2022.
//

import SwiftUI

final class MoviesVM:ObservableObject {
    var persistence: NetworkPersistenceProtocol
    
    @Published var error: Error?
    @Published var movies:[Movie]
    @Published var genres:[Genre]
    
    init(
        movies:[Movie] = [],
        genres: [Genre] = [],
        persistence: NetworkPersistenceProtocol = NetworkPersistence.share
    ) {
        self.movies = movies
        self.genres = genres
        self.persistence = persistence
    }
    
    @MainActor func getMovies() async {
        do {
            async let genresTask = persistence.getGenres()
            async let moviesTask = persistence.getNowPlaying()
            (genres, movies) = try await (genresTask, moviesTask)
            error = nil
        } catch {
            self.error = error
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
