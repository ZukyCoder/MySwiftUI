//
//  ContentView.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 20/10/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var moviesVM:MoviesVM
    
    
    var body: some View {
        List(moviesVM.movies){ movie in
            VStack(alignment: .leading) {
                MovieCellView(movie: movie)
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
