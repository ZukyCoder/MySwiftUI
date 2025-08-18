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
    var size = CGFloat(Constants.Layout.general150)

    var body: some View {
        Circle()
            .frame(width: size)
            .overlay {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: Constants.Layout.general8 * (size / Constants.Layout.general150)))
                    .fill(.gray.opacity(Constants.ColorOpacities.opacity4))
                    .rotationEffect(.degrees(-Constants.AngleDegrees.quarterCircle))
                    .padding(Constants.Layout.padding10 * (size / Constants.Layout.general150))
            }
            .overlay {
                Circle()
                    .trim(from: Constants.Layout.general0, to: fill)
                    .stroke(style: StrokeStyle(lineWidth: Constants.Layout.general8 * (size / Constants.Layout.general150), lineCap: .round))
                    .fill(.angularGradient(colors: [.red, .orange, .mint, .green],
                                           center: .center,
                                           startAngle: Angle(degrees: Constants.AngleDegrees.angle83),
                                           endAngle: Angle(degrees:Constants.AngleDegrees.angle270)))
                    .rotationEffect(.degrees(-Constants.AngleDegrees.quarterCircle))
                    .padding(Constants.Layout.padding10 * (size / Constants.Layout.general150))
                
                
            }
            .overlay {
                let percent = (percent * 10).formatted(.number.precision(.fractionLength(0)))
                HStack(alignment: .top, spacing: 0) {
                    Text("\(percent)")
                        .font(.system(size: 60 * (size / Constants.Layout.general150), design: .rounded))
                        .bold()
                    Text("%")
                        .font(.system(size: 18 * (size / Constants.Layout.general150)))
                        .padding(.top, 14 * (size / Constants.Layout.general150))
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
