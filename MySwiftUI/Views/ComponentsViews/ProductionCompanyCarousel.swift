//
//  ProductionCompanyCarousel.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 22/7/24.
//

import SwiftUI

struct ProductionCompanyCarousel: View {
    var productionCompanies:[ProductionCompany]
    var body: some View {
        VStack(alignment: .leading){
            Text("Productoras")
                .font(.headline)
                .padding([.top, .bottom], 10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(productionCompanies) { company in
                        VStack{
                            if let logoPath = company.logoPath {
                                AsyncImage(url: NetworkPersistence.share.getImageURL(file: logoPath, type: .logo)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 50)
                                } placeholder: {
                                    Image(systemName: "popcorn.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 50)
                                }
                            } else {
                                Image(systemName: "popcorn")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 50)
                            }
                            Text(company.name)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProductionCompanyCarousel(productionCompanies: [.testData])
}
