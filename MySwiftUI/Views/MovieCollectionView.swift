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
    
    let gridItems: [GridItem] = [GridItem(.adaptive(minimum: Constants.Layout.minimumWidth150))]
    let nameSpace: Namespace.ID
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: Constants.Layout.spacing20) {
                ForEach(movieCellVM.movies) {movie in
                    MovieCellView(movie: movie, nameSpace: nameSpace)
                        .onTapGesture {
                            showBack.toggle()
                            selectedMovie = movie
                        }
                        .accessibilityIdentifier("MovieCellView")
                }
            }
        }
        .padding(.horizontal, Constants.Layout.standardPadding)
    }
}

#Preview {
    MovieCollectionView(showBack: .constant(true), selectedMovie: .constant(.testMovie), nameSpace: Namespace().wrappedValue )
        .environmentObject(MoviesVM(movies: getTestMovies(),genres: getTestGenres()))
}
