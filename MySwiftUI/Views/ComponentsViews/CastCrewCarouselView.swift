//
//  CastCrewCarouselView.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 30/7/24.
//

import SwiftUI

struct CastCrewCarouselView: View {
    let castCrewDetail:[CastCrew]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(castCrewDetail) { detail in
                    CastCrewCellView(castCrew: detail)
                }
            }
            .padding(.leading, 16)
            .padding([.top, .bottom])
        }
    }
}

#Preview {
    CastCrewCarouselView(castCrewDetail: [.theRock, .director])
}
