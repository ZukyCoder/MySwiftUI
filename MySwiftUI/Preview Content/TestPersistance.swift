//
//  TestPersistance.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 24/10/2022.
//

import Foundation

func getTestMovies() -> [Movie] {
    guard let url = Bundle.main.url(forResource: "testMovies", withExtension: "json") else { return [] }
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.JSONFormatter)
        return try decoder.decode(MovieList.self, from: data).results
    } catch {
        return []
    }
}

func getTestGenres() -> [Genre] {
    guard let url = Bundle.main.url(forResource: "testGenres", withExtension: "json") else { return [] }
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.JSONFormatter)
        return try decoder.decode(Genres.self, from: data).genres
    } catch {
        return []
    }
}
