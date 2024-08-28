//
//  Interface.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 20/10/2022.
//

import Foundation

extension String {
    static let lenguageParams = "?language=es-ES"
}

extension URLQueryItem {
    static let lenguage = URLQueryItem(name: "language", value: "es-ES")
    static let region = URLQueryItem(name: "region", value: "ES")
}
extension URL {
    static let baseURL = URL(string: "https://api.themoviedb.org/3")!
    static let getAPIConfiguration = baseURL.appending(path: "configuration")
    static let getGeners = baseURL.appending(path: "genre/movie/list").appending(queryItems: [.lenguage])
    static let getNowPlaying = baseURL.appending(path: "movie/now_playing").appending(queryItems: [.lenguage,.region])
    
    static func getMoviesDetails(movie: Int) -> URL {
        baseURL.appending(path: "movie/\(movie)").appending(queryItems: [.lenguage])
    }
    
    static func getMoviesCredits(movie: Int) -> URL {
        baseURL.appending(path: "movie/\(movie)/credits").appending(queryItems: [.lenguage,.region])
    }
}

extension URLRequest {
    static func movieRequest(url: URL) -> URLRequest {
       var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZmJmNzhkNDg5ZGM1MDVlN2M1NmRlZTRkYTM3NTdkNiIsInN1YiI6IjYzNTBlZTFkNGNhNjc2MDA3ZmUzMWVjMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7TKTpMHvD3X_mumVkv3Fm5dPL8HUy9P-lhAiG4R5fJ8", forHTTPHeaderField: "Authorization")
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
