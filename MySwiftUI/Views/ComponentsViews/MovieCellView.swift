//
//  MovieCellView.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 26/10/2022.
//

import SwiftUI

struct MovieCellView: View {
    @EnvironmentObject var moviesVM:MoviesVM
    @StateObject var cell = CellVM()
    
    let movie: Movie
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15, style: .continuous)
            .fill(.linearGradient(colors:[Color(cell.color).opacity(0.9),
                                          Color(cell.color).opacity(0.4)],
                                  startPoint: .top,
                                  endPoint: .bottom))
            .frame(width: 150, height: 350)
            .shadow(color: .primary.opacity(0.4),radius: 5.0, x: 0, y: 5)
            .overlay {
                VStack(alignment: .leading) {
                    if let poster = cell.poster {
                        Image(uiImage: poster)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 230, alignment: .top)
                    } else {
                        Image("notfound")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 230, alignment: .top)
                    }
                    RatingCircleView(percent: movie.voteAverage, size: 35)
                        .padding(.leading, 5)
                        .offset(y: -30)
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.subheadline)
                            .bold()
                        Text(moviesVM.getGenre(generos: movie.genreIDS))
                            .font(.system(size: 10))
                    }
                    .foregroundStyle(.white)
                    .padding(.top, -30)
                    .padding(.leading, 5)
                    Spacer()
                }
                .frame(width: 150,height: 350)
                .mask {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                }
                .task {
                    await cell.getPoster(movie: movie)
                }
            }
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(movie: .testMovie)
            .previewLayout(.fixed(width: 150, height: 350))
            .environmentObject(MoviesVM(movies: getTestMovies(),geners: getTestGenres()))
    }
}

/*
AsyncImage(url: NetworkPersistence.share.getImageURL(file: movie.posterPath, type: .poster)) { image in
    image
        .resizable()
        .scaledToFit()
        .frame(width: 150, height: 230, alignment: .top)
} placeholder: {
    Image("notfound")
        .resizable()
        .scaledToFit()
        .frame(width: 150, height: 230, alignment: .top)
}
*/
