//
//  CellVM.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 29/10/2022.
//

import Foundation
import UIKit

final class CellVM: ObservableObject {
    let persistence = NetworkPersistence.share
    
    @Published var poster: UIImage? {
        didSet {
            if let poster, let color =  poster.averageColor{
                self.color = color
            }
        }
    }
    @Published var color:UIColor = .gray
    
    @MainActor func getPoster(movie: Movie) async {
        do {
            poster = try await persistence.getPoster(file: movie.posterPath)
        } catch {
            // Surface error to UI or log for analytics
            // Example: add an @Published var error: Error? and set it here
            // error = error
            print("Error loading image: \(error.localizedDescription)")
        }
    }
}
