//
//  NetworkPersistence.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 21/10/2022.
//

import Foundation
import UIKit

final class NetworkPersistence {
    enum ImageType{
        case backDrop, logo, poster, profile, still
    }
    
    static let share = NetworkPersistence()
    
    var configuration:Configuration?
    
    init(){
        Task {
            do {
                self.configuration = try await getConfiguration()
            } catch {
                print("Error \(error)")
            }
        }
    }
    
    func getConfiguration() async throws -> Configuration {
        try await getJSON(url: .getAPIConfiguration, type: Configuration.self)
    }
    
    func getGeners() async throws -> [Genre] {
        try await getJSON(url: .getGeners, type: Genres.self).genres
    }
    
    func getNowPlaying() async throws -> [Movie]{
        try await getJSON(url: .getNowPlaying, type: MovieList.self).results
    }
    
    func getMovieDetails(id: Int) async throws -> MovieDetail {
        try await getJSON(url: .getMoviesDetails(movie: id), type: MovieDetail.self)
    }
    
    func getMovieCastCrew(id: Int) async throws -> MovieCredits {
        try await getJSON(url: .getMoviesCredits(movie: id), type: MovieCredits.self)
    }
    
    func getImageURL(file:String, type: ImageType) -> URL? {
        guard let configuration else { return nil }
        let baseURL = configuration.images.secureBaseURL
        switch type {
        case .backDrop:
            return baseURL
                .appending(path: configuration.images.backdropSizes.dropLast().last ?? "")
                .appending(path: file)
        case .logo:
            return baseURL
                .appending(path: configuration.images.logoSizes.dropLast().last ?? "")
                .appending(path: file)
        case .poster:
            return baseURL
                .appending(path: configuration.images.posterSizes.dropLast().last ?? "")
                .appending(path: file)
        case .profile:
            return baseURL
                .appending(path: configuration.images.profileSizes.dropLast().last ?? "")
                .appending(path: file)
        case .still:
            return baseURL
                .appending(path: configuration.images.stillSizes.dropLast().last ?? "")
                .appending(path: file)
        }
    }
    
    func getPoster(file: String) async throws -> UIImage? {
        let urlFile = URL.cachesDirectory.appending(path: file)
        if FileManager.default.fileExists(atPath: urlFile.path()) {
            let data = try Data(contentsOf: urlFile)
            return UIImage(data: data)
        } else {
            guard let url = getImageURL(file: file, type: .poster) else { return nil }
            let image = try await getImage(url: url)
            if let data = image.jpegData(compressionQuality: 0.7) {
                try data.write(to: urlFile, options: [.atomic, .completeFileProtection])
            }
            return image
        }
    }
    
    func getJSON<JSONType:Codable>(url: URL, type: JSONType.Type) async throws -> JSONType {
        do{
            let (data, response) = try await URLSession.shared.data(for: .movieRequest(url: url))
            guard let response = response as? HTTPURLResponse else { throw NetworkErrors.noHTTP }
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(.JSONFormatter)
                    return try decoder.decode(JSONType.self, from: data)
                } catch {
                    throw NetworkErrors.json(error)
                }
            } else {
                throw NetworkErrors.statusCode(response.statusCode)
            }
        } catch let error as NetworkErrors {
            throw error
        } catch {
            throw NetworkErrors.general(error)
        }
    }
    
    func getImage(url: URL) async throws -> UIImage {
        do{
            let (data, response) = try await URLSession.shared.data(for: .movieRequest(url: url))
            guard let response = response as? HTTPURLResponse else { throw NetworkErrors.noHTTP }
            if response.statusCode == 200 {
                if let image = UIImage(data: data) {
                    return image
                } else {
                    throw NetworkErrors.dataCoding
                }
            } else {
                throw NetworkErrors.statusCode(response.statusCode)
            }
        } catch let error as NetworkErrors {
            throw error
        } catch {
            throw NetworkErrors.general(error)
        }
    }
}
