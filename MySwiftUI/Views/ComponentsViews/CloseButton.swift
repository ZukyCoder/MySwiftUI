//
//  CloseButton.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 23/7/24.
//

import SwiftUI

struct CloseButton: View {
    let action:() -> ()
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark")
                .symbolVariant(.circle)
                .symbolVariant(.fill)
                .font(.largeTitle)
                .foregroundColor(.white.opacity(0.5))
                .shadow(color: .black,radius: 18)
        }
    }
}

#Preview {
    CloseButton(action: {})
}
