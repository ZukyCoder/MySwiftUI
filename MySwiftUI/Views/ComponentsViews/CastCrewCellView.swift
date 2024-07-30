//
//  CastCrewCellView.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 29/7/24.
//

import SwiftUI

struct CastCrewCellView: View {
    let castCrew:CastCrew
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15, style: .continuous)
            .fill(.white)
            .frame(width: 100, height: 250)
            .shadow(color: .primary.opacity(0.4),radius: 5.0, x: 0, y: 5)
            .overlay {
                VStack(alignment: .leading) {
                    if let profilePath = castCrew.profilePath {
                        AsyncImage(url: NetworkPersistence.share.getImageURL(file: profilePath, type: .profile)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 150, alignment: .top)
                        } placeholder: {
                            Image("notfound")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 150, alignment: .top)
                            
                        }
                    } else {
                        Image("notfound")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 150, alignment: .top)
                    }
                    VStack(alignment: .leading) {
                        Text(castCrew.name)
                            .font(.subheadline)
                            .bold()
                        if let character = castCrew.character {
                            Text(character)
                                .font(.system(size: 10))
                        } else if let job = castCrew.job {
                            Text(job)
                                .font(.system(size: 10))
                        }
                    }
                    .padding(.leading, 5)
                    Spacer()
                }
                .frame(width: 100,height: 250)
                .mask {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                }
            }
    }
}

#Preview {
    Group {
        CastCrewCellView(castCrew: .theRock)
        CastCrewCellView(castCrew: .director)
            .previewDevice("iPhone 12 mini")
    }
    
}
