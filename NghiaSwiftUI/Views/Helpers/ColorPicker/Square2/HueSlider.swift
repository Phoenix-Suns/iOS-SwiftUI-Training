//
//  HueSlider.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/21/24.
//

import SwiftUI

struct HueSlider: View {
    @Binding var hue: Double

    var body: some View {
        CustomSlider(value: $hue) {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    colors
                        .first
                        .frame(width: geometry.size.height / 2)
                    LinearGradient(
                        colors: colors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    colors
                        .last
                        .frame(width: geometry.size.height / 2)
                }
            }
        } thumb: {
            Circle()
                .fill(fullySaturatedColor)
                .overlay {
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 2)
                }
                .shadow(radius: 0.5)
                .padding(2)
        }
        .frame(height: 24)
    }

    private var colors: [Color] {
        Array(stride(from: 0.0, to: 361.0, by: 30.0))
            .map { $0 / 360 }
            .map { normalizedHue in
                Color(hue: normalizedHue, saturation: 1, brightness: 1, opacity: 1)
            }
    }

    private var fullySaturatedColor: Color {
        Color(hue: hue, saturation: 1, brightness: 1, opacity: 1)
    }
}

#Preview {
    @State var hue: Double = 0.5
    return HueSlider(hue: $hue)
}
