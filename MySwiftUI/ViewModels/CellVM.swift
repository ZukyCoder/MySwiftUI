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
    
    @Published var poster: UIImage?
    
    func getPoster(movie: Movie) async {
        do {
            poster = try await persistence.getPoster(file: movie.posterPath)
        } catch {
            print("Error loading Image \(error.localizedDescription)")
        }
    }
}
