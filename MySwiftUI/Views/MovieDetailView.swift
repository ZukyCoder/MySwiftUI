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
                VStack(alignment: .leading) {
                    MovieDetailsView(details: detailVM.details)
                        .padding(.bottom)
                    Text("Movie Cast")
                        .font(.headline)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding(.leading)
                    CastCrewCarouselView(castCrewDetail: detailVM.cast)
                        .padding(.bottom)
                    Text("Movie Crew")
                        .font(.headline)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding(.leading)
                    CastCrewCarouselView(castCrewDetail: detailVM.crew)
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear
                    .frame(height: UIDevice.bottomInsetSize)
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
