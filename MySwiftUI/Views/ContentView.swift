//
//  ContentView.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 20/10/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var moviesVM:MoviesVM
    
    @State var selectedMovie:Movie?
    @State var showBack = false
    @Namespace var nameSpace
    
    let gridItems: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ZStack {
            if showBack {
                MovieDetailView(showBack: $showBack, movie: $selectedMovie, nameSpace: nameSpace)
            } else {
                MovieCollectionView(showBack: $showBack, selectedMovie: $selectedMovie, nameSpace: nameSpace)
            }
        }
        .animation(.spring(), value: showBack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MoviesVM(movies: getTestMovies(),geners: getTestGenres()))
    }
}
