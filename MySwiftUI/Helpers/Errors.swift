//
//  Errors.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 21/10/2022.
//

import Foundation

enum NetworkErrors:Error {
    case general(Error)
    case statusCode(Int)
    case json(Error)
    case noHTTP
    case dataCoding
    
    var description:String {
        switch self {
        case .general(let error):
            return "General Error: \(error.localizedDescription)"
        case .statusCode(let int):
            return "Status Error \(int)"
        case .json(let error):
            return "Json Error \(error)"
        case .noHTTP:
            return "HTTP Conecction Error"
        case .dataCoding:
            return "Invalid Data"
        }
    }
}
