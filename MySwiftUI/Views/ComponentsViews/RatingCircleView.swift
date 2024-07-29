//
//  RatingCircleView.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 26/7/24.
//

import SwiftUI

struct RatingCircleView: View {
    @State var fill = 0.0
    var percent:Double
    var size = CGFloat(150)

    var body: some View {
        Circle()
            .frame(width: size)
            .overlay {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 8 * (size / 150)))
                    .fill(.gray.opacity(0.4))
                    .rotationEffect(.degrees(-90))
                    .padding(10 * (size / 150))
            }
            .overlay {
                Circle()
                    .trim(from: 0, to: fill)
                    .stroke(style: StrokeStyle(lineWidth: 8 * (size / 150), lineCap: .round))
                    .fill(.angularGradient(colors: [.red, .orange, .mint, .green],
                                           center: .center,
                                           startAngle: Angle(degrees: 83),
                                           endAngle: Angle(degrees:270)))
                    .rotationEffect(.degrees(-90))
                    .padding(10 * (size / 150))
                
                
            }
            .overlay {
                let percent = (percent * 10).formatted(.number.precision(.fractionLength(0)))
                HStack(alignment: .top, spacing: 0) {
                    Text("\(percent)")
                        .font(.system(size: 65 * (size / 150), design: .rounded))
                        .bold()
                    Text("%")
                        .font(.system(size: 18 * (size / 150)))
                        .padding(.top, 14 * (size / 150))
                }
                .foregroundStyle(.white)
            }
            .onAppear {
                fill = percent / 10
            }
            .animation(.easeInOut(duration: 2.0), value: fill)
    }
}

#Preview {
    RatingCircleView(percent: 7.112 )
}
