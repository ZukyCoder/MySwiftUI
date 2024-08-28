//
//  MovieDetailsView.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 23/7/24.
//

import SwiftUI

struct MovieDetailsView: View {
    var details:MovieDetail?
    
    var body: some View {
        if let details {
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
}

#Preview {
    MovieDetailsView(details: .testDetail)
}
