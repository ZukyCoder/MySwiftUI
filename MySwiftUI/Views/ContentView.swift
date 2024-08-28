//
//  ContentView.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 20/10/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var moviesVM:MoviesVM
    let gridItems: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    
    @State var selectedMovie:Movie?
    
    var body: some View {
        ZStack {
            if selectedMovie != nil {
                MovieDetailView(movie: $selectedMovie)
            } else {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 20) {
                        ForEach(moviesVM.movies) {movie in
                            MovieCellView(movie: movie)
                                .onTapGesture {
                                    selectedMovie = movie
                                }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MoviesVM(movies: getTestMovies(),geners: getTestGenres()))
    }
}
