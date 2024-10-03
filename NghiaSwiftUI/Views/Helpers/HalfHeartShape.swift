//
//  HalfHeartShape.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 7/22/24.
//

import SwiftUI

struct HalfHeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height

        path.move(to: CGPoint(x: width / 2, y: height))
        
        path.addCurve(to: CGPoint(x: 0, y: height / 4),
                      control1: CGPoint(x: width / 2, y: height * 3 / 4),
                      control2: CGPoint(x: 0, y: height / 2))
        
        path.addArc(center: CGPoint(x: width / 4, y: height / 4),
                    radius: width / 4,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: width / 2, y: height))
        
        return path
    }
}

#Preview {
    Image(systemName: "photo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 200, height: 200)
        .clipShape(HalfHeartShape()) // Clip to a half-heart shape
        .overlay(
            HalfHeartShape()
                .stroke(Color.red, lineWidth: 5) // Add a stroke to the half-heart shape
                .frame(width: 200, height: 200)
        )
}
