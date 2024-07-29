//
//  MovieDetailView.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 26/10/2022.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var detailVM = MovieDetailVM()
    
    @Binding var movie:Movie?
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack {
                    detailVM.poster
                        .resizable()
                        .scaledToFit()
                }
                RatingCircleView(percent: movie?.voteAverage ?? 0.0, size: 75)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .offset(y: -50)
                MovieDetailsView(details: detailVM.details)
                    .padding(.top, -50)
                    .padding(.bottom, 50)
            }
            .ignoresSafeArea()
            
            CloseButton {
                movie = nil
            }
            .padding(.trailing)
        }
        .onAppear {
            detailVM.getPoster(movie: movie)
        }
        .task {
            guard let movie = movie else { return }
            await detailVM.getDetails(movie: movie.id)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .constant(.testMovie))
    }
}
