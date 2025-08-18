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
    let nameSpace: Namespace.ID
    
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.Layout.cornerRadius15, style: .continuous)
            .fill(.linearGradient(colors:[Color(cell.color).opacity(Constants.ColorOpacities.opacity9),
                                          Color(cell.color).opacity(Constants.ColorOpacities.opacity4)],
                                  startPoint: .top,
                                  endPoint: .bottom))
        
            .frame(minWidth: Constants.Layout.minimumWidth150, minHeight: Constants.Layout.minimumHeight350)
            .shadow(color: .primary.opacity(Constants.ColorOpacities.opacity4),radius: 5.0, x: 0, y: 5)
            .overlay {
                VStack(alignment: .leading) {
                    AsyncImage(url: NetworkPersistence.share.getImageURL(file: movie.posterPath, type: .poster)) { image in
                    image
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: Constants.Layout.minimumWidth150, minHeight: Constants.Layout.minimumHeight200, alignment: .top)
                    } placeholder: {
                    Image("notfound")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: Constants.Layout.minimumWidth150, minHeight: Constants.Layout.minimumHeight200, alignment: .top)
                    }
                    RatingCircleView(percent: movie.voteAverage, size: 35)
                        .padding(.leading, Constants.Layout.padding5)
                        .offset(y: -Constants.Layout.offset30)
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.subheadline)
                            .bold()
                        Text(moviesVM.getGenre(generos: movie.genreIDS))
                            .font(.system(size: 10))
                    }
                    .foregroundStyle(.white)
                    .padding(.top, -Constants.Layout.offset30)
                    .padding(.leading, Constants.Layout.padding5)
                    Spacer()
                }
                .frame(minWidth: Constants.Layout.minimumWidth150, minHeight: Constants.Layout.minimumHeight350)
                .mask {
                    RoundedRectangle(cornerRadius: Constants.Layout.cornerRadius15, style: .continuous)
                }
                .task {
                    await cell.getPoster(movie: movie)
                }
            }
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(movie: .testMovie, nameSpace: Namespace().wrappedValue)
            .previewLayout(.fixed(width: Constants.Layout.minimumWidth150, height: Constants.Layout.minimumHeight350))
            .environmentObject(MoviesVM(movies: getTestMovies(),genres: getTestGenres()))
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
