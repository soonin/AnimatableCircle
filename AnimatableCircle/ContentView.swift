//
//  ContentView.swift
//  ProgressCircle
//
//  Created by Pooya on 2021-01-23.
//  Copyright © 2021 Pooya. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 6)
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemGray6))

            Rectangle()
                .frame(width: 24, height: 24)
                .foregroundColor(Color(.systemIndigo))
                .cornerRadius(2)

            AnimatableCirclee(progress: progress)
                .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemIndigo))
                .animation(Animation.easeInOut.speed(0.25))
                .onAppear() {
                    self.progress = 1
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimatableCirclee: Shape {
    var progress: CGFloat

    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    func path(in rect: CGRect) -> Path {
        let centerX: CGFloat = rect.width / 2
        let centerY: CGFloat = rect.height / 2
        var path = Path()
        path.addArc(center: CGPoint(x: centerX, y: centerY),
                    radius: 45,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 360 * Double(progress)),
                    clockwise: false)
        return path
    }
}
