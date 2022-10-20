//
//  Interface.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 20/10/2022.
//

import Foundation

extension URL {
    static let baseURL = URL(string: "")!
    static let getAPIConfiguration = baseURL.appending(path: "")
    static let getGeners = baseURL.appending(path: "")
    static let getNowPlaying = baseURL.appending(path: "")
    
    static func getMoviesDetails(movie: Int) -> URL {
        baseURL.appending(path: "")
    }
    
    static func getMoviesCredits(movie: Int) -> URL {
        baseURL.appending(path: "")
    }
}

extension URLRequest {
    static func movieRequest(url: URL) -> URLRequest {
       var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("", forHTTPHeaderField: "Content-Type")
        request.addValue("", forHTTPHeaderField: "Accept")
        request.addValue("", forHTTPHeaderField: "Accept")
        return request
    }
}
