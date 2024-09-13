//
//  MovieCollectionView.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 31/7/24.
//

import SwiftUI

struct MovieCollectionView: View {
    @Binding var showBack:Bool
    @Binding var selectedMovie:Movie?
    @EnvironmentObject var movieCellVM:MoviesVM
    
    let gridItems: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    let nameSpace: Namespace.ID
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 20) {
                ForEach(movieCellVM.movies) {movie in
                    MovieCellView(movie: movie)
                        .onTapGesture {
                            showBack.toggle()
                            selectedMovie = movie
                        }
                        .accessibilityIdentifier("MovieCellView")
                }
            }
        }
    }
}

#Preview {
    MovieCollectionView(showBack: .constant(true), selectedMovie: .constant(.testMovie), nameSpace: Namespace().wrappedValue )
        .environmentObject(MoviesVM(movies: getTestMovies(),geners: getTestGenres()))
}
