//
//  MovieCellView.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 26/10/2022.
//

import SwiftUI

struct MovieCellView: View {
    @EnvironmentObject var moviesVM:MoviesVM
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: NetworkPersistence.share.getImageURL(file: movie.posterPath, type: .poster)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                    .cornerRadius(15)
            } placeholder: {
                Image("notfound")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                    .cornerRadius(15)
            }
            Text(movie.title)
            Text(moviesVM.getGenre(generos: movie.genreIDS))
                .font(.caption)
            
        }
        
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(movie: .testMovie)
            .environmentObject(MoviesVM(movies: getTestMovies(),geners: getTestGenres()))
    }
}
