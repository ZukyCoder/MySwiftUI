//
//  NetworkPersistence.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 21/10/2022.
//

import Foundation
import UIKit

final class NetworkPersistence {
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
    
    //func getImageURL(file:String, type: ImageType) -> URL? {
//        guard let configuration else { return nil }
//        let baseRL = configuration.images.secureBaseURL
//        switch type {
//        case backDrope:
//                .appending(path: configuration.images.backDropeSize)
//        default:
//        }
   // }
    
    func getConfiguration() async throws -> Configuration {
        try await getJSON(url: .getAPIConfiguration, type: Configuration.self)
    }
    
    func getGeners() async throws -> [Genre] {
        try await getJSON(url: .getGeners, type: Genres.self).genres
    }
    
    func getNowPlaying() async throws -> [Movie]{
        try await getJSON(url: .getNowPlaying, type: MovieList.self).results
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
}
