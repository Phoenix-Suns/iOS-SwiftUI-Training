//  File name   : RingColorPickerView.swift
//
//  Author      : Nghia Tran
//  Created date: 5/21/2024
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2024 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import SwiftUI

struct RingColorPickerView: View {
    @Binding var selectedColor: Color
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                AngularGradient(gradient: gradient(), center: UnitPoint(x: 0.5, y: 0.5))
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(-90))
                    .clipShape(Circle())
                
                let markerPosition = measureMarkerPosition(containerSize: geo.size)
                    markerView
//                    .offset(x: 0, y: -geo.size.height / 2)
//                    .rotationEffect(.degrees(dAngle))
                    .position(x: markerPosition.x, y: markerPosition.y)
            }
            .gesture(measureAngle(width: geo.size.width, height: geo.size.height))
        }
        .aspectRatio(contentMode: .fit)
    }
    
    /// Struct's private properties.
    @State private var dAngle: CGFloat = 0
    private let markerSize: CGFloat = 64
}

// MARK: View
private extension RingColorPickerView {
    @ViewBuilder
    var markerView: some View {
        Circle()
            .frame(width: markerSize, height: markerSize)
            .foregroundColor(selectedColor)
    }
}

// MARK: Private functions
private extension RingColorPickerView {
    func gradient() -> Gradient {
        let colors = (0 ... 360).map {
            Color(hue: Double($0) / 360, saturation: 1, brightness: 1)
        }
        return Gradient(colors: colors)
    }
    
    private func location2Degrees(location: CGPoint, midX: CGFloat, midY: CGFloat) -> CGFloat {
        let radians = location.y < midY
        ? atan2(location.x - midX, midY - location.y)
        : .pi - atan2(location.x - midX, location.y - midY)
        let degrees = radians * 180 / .pi
        return degrees < 0 ? degrees + 360 : degrees
    }
    
    private func measureAngle(width: CGFloat, height: CGFloat) -> some Gesture {
        DragGesture()
            .onChanged { value in
                let midX = width / 2
                let midY = height / 2
                self.dAngle = location2Degrees(location: value.location, midX: midX, midY: midY)
                self.selectedColor = Color(hue: Double(dAngle) / 360, saturation: 1, brightness: 1)
            }
    }
    
    func measureMarkerPosition(containerSize: CGSize) -> CGPoint {
        let midX = containerSize.width / 2
        let midY = containerSize.height / 2

        let distance = containerSize.height / 2 - (markerSize / 2)
        let dAngle = self.dAngle - 90 // angle from Vertical to Horizontal
        let rAngle = dAngle * Double.pi / 180
        let x = distance * cos(rAngle) + midX
        let y = distance * sin(rAngle) + midY
        return CGPoint(x: x, y: y)
    }
}

#Preview {
    RingColorPickerView(selectedColor: .constant(.random))
}
