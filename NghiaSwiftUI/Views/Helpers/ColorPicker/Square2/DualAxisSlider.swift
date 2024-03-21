//
//  DualAxisSlider.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/21/24.
//

import SwiftUI

struct DualAxisSlider<Background, Cursor>: View where Background: View,
    Cursor: View
{
    @Binding var horizontal: Double
    @Binding var vertical: Double
    @ViewBuilder var background: Background
    @ViewBuilder var cursor: Cursor

    var body: some View {
        GeometryReader { geometry in
            background
                .drawingGroup()
                .overlay(alignment: .bottomLeading) {
                    cursor
                        .frame(width: 20, height: 20)
                        .shadow(radius: 0.5)
                        .offset(x: -10, y: 10)
                        .offset(
                            x: horizontal * geometry.size.width,
                            y: -vertical * geometry.size.height
                        )
                }
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            horizontal = (
                                value.location.x / geometry.size.width
                            )
                            .limited(to: 0 ... 1)
                            vertical = 1 -
                                (value.location.y / geometry.size.height)
                                .limited(to: 0 ... 1)
                        }
                )
        }
    }
}

#Preview {
    @State var horizontal: Double = 1
    @State var vertical: Double = 1
    
    return VStack {
        Text("horizontal: \(horizontal)")
        Text("vertical: \(vertical)")
        DualAxisSlider(
            horizontal: $horizontal,
            vertical: $vertical
        ) {
            Color.gray
        } cursor: {
            Circle()
        }
    }
}
