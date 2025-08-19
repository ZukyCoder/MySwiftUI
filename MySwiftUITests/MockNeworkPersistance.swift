//
//  MockNeworkPersistance.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 19/8/25.
//
import UIKit
@testable import MySwiftUI

// Create mock implementations of the full protocol
class MockFailingPersistence: NetworkPersistenceProtocol {
    func getConfiguration() async throws -> Configuration {
        throw URLError(.badServerResponse)
    }
    
    func getGenres() async throws -> [Genre] {
        throw URLError(.badServerResponse)
    }
    
    func getNowPlaying() async throws -> [Movie] {
        throw URLError(.badServerResponse)
    }
    
    func getMovieDetails(id: Int) async throws -> MovieDetail {
        throw URLError(.badServerResponse)
    }
    
    func getMovieCastCrew(id: Int) async throws -> MovieCredits {
        throw URLError(.badServerResponse)
    }
    
    func getPoster(file: String) async throws -> UIImage? {
        throw URLError(.badServerResponse)
    }
    
    func getImageURL(file: String, type: ImageType) -> URL? {
        return nil
    }
}

class MockSuccessPersistence: NetworkPersistenceProtocol {
    func getConfiguration() async throws -> Configuration {
        var image = Images(
            baseURL: URL(string: "") ?? URL(fileURLWithPath: ""),
            secureBaseURL: URL(string: "https://image.tmdb.org/t/p/")!,
            backdropSizes: ["w300"],
            logoSizes: ["w300"],
            posterSizes: ["w300"],
            profileSizes: ["w300"],
            stillSizes: ["w300"]
        )
        
        return Configuration(images: image, changeKeys: [])
    }
    
    func getGenres() async throws -> [Genre] {
        return [Genre(id: 1, name: "Action"), Genre(id: 2, name: "Comedy")]
    }
    
    func getNowPlaying() async throws -> [Movie] {
        return [Movie.testMovie]
    }
    
    func getMovieDetails(id: Int) async throws -> MovieDetail {
        return MovieDetail.testDetail
    }
    
    func getMovieCastCrew(id: Int) async throws -> MovieCredits {
        return MovieCredits(id: id, cast: [], crew: [])
    }
    
    func getPoster(file: String) async throws -> UIImage? {
        return UIImage()
    }
    
    func getImageURL(file: String, type: ImageType) -> URL? {
        return URL(string: "https://example.com/\(file)")
    }
}
