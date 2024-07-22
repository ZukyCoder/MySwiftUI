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
                if let details = detailVM.details {
                    VStack(alignment: .leading) {
                        Text(details.title)
                            .font(.title)
                            .bold()
                        
                        Text(details.tagline)
                            .font(.headline)
                        
                        Text(details.overview)
                            .padding(.vertical, 10)
                        
                        Text("Presupuesto: **\(details.budget)**")
                        if details.revenue > 0 {
                            Text("Beneficio: **\(details.revenue)**")
                        }
                        Text("Duracion: \(details.runtime) min.")
                        
                        ProductionCompanyCarousel(productionCompanies: details.productionCompanies)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
            }
            .ignoresSafeArea()
            Button {
                movie = nil
            } label: {
                Image(systemName: "xmark")
                    .symbolVariant(.circle)
                    .symbolVariant(.fill)
                    .font(.largeTitle)
                    .foregroundColor(.white.opacity(0.5))
                    .shadow(color: .black,radius: 18)
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
