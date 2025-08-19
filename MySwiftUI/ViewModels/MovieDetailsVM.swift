//
//  MovieDetailsVM.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 17/7/24.
//

import SwiftUI

final class MovieDetailVM:ObservableObject {
    let persistance: NetworkPersistenceProtocol
    
    @Published var poster = Image("notfound")
    @Published var details:MovieDetail?
    @Published var cast:[CastCrew]
    @Published var crew:[CastCrew]
    
    init(
        poster: Image = Image("notfound"),
        details: MovieDetail? = nil,
        cast: [CastCrew] = [],
        crew: [CastCrew] = [],
        persistance: NetworkPersistenceProtocol = NetworkPersistence.share
    ) {
        self.poster = poster
        self.details = details
        self.cast = cast
        self.crew = crew
        self.persistance = persistance
    }
    
    
    @MainActor func getDetails(movie: Int) async {
        do {
            let (detail, credits) = try await (persistance.getMovieDetails(id: movie), persistance.getMovieCastCrew(id: movie))
            self.details = detail
            self.cast = credits.cast
            self.crew = credits.crew
        } catch {
            // Surface error to UI or log for analytics
            // Example: add an @Published var error: Error? and set it here
            // error = error
            print("Error recovering details: \(error.localizedDescription)")
        }
    }
    
    func getPoster(movie: Movie?) {
        guard let movie else { return }
        let urlFile = URL.cachesDirectory.appending(path: movie.posterPath)
        if FileManager.default.fileExists(atPath: urlFile.path()) {
            if let data = try? Data(contentsOf: urlFile), let image = UIImage(data: data) {
                self.poster = Image(uiImage: image)
            }
        } else {
            self.poster = Image("vpnVM9B6NMmQpWeZvzLvDESb2QY")
        }
    }
}
