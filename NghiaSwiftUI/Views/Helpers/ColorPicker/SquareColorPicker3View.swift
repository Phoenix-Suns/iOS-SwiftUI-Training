//
//  SquareColorPicker3View.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/20/24.
//

import SwiftUI

struct SquareColorPicker3View: View {
    @Binding private var selectedColor: Color
    @State private var hue: Double = 0.5
    @State private var alpha: Double = 1
    @State var saturation: Double = 1
    @State var lightness: Double = 1
    @State var horizontal: Double = 1
    
    private var colorChangeFlag: [String] {[
        hue.description,
        saturation.description,
        lightness.description,
        alpha.description,
    ]}
    
    /// Struct's constructor.
    init(selectedColor: Binding<Color>) {
        self._selectedColor = selectedColor
    }
    
    var body: some View {
            VStack {
//                DualAxisSlider(horizontal: $lightness, vertical: $hue) {
                DualAxisSlider(horizontal: $horizontal, vertical: $hue) {
                
                            ZStack {
                                LinearGradient(
                                    colors: colors,
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                LinearGradient(
                                    colors: [Color.white, Color.clear, Color.black],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .blendMode(.hardLight)
                            }
                        } cursor: {
                            Circle()
                                .fill(selectedColor)
                                .overlay {
                                    Circle()
                                        .fill(Color(hue: hue, saturation: saturation, brightness: lightness))
                                    Circle()
                                        .strokeBorder(.white, lineWidth: 2)
                                }
                        }
                
                AlphaSlider(alpha: $alpha, color: selectedColor)
            }
            .onChange(of: horizontal) { value in
                debugPrint("horizontal:\(horizontal)")
                if value <= 0.5 {
                    lightness = 1
                    saturation = value * 2
                } else {
                    lightness = 2 - 2*value
                    saturation = 1
                }
            }
            .onChange(of: colorChangeFlag) { _ in
                selectedColor = Color(hue: hue, saturation: saturation, brightness: lightness, opacity: alpha)
            }
        }
}

extension SquareColorPicker3View {
    private var colors: [Color] {
        Array(stride(from: 0.0, to: 361.0, by: 30.0))
            .map { $0 / 360 }
            .map { normalizedHue in
                Color(hue: normalizedHue, saturation: 1, brightness: 1, opacity: 1)
            }
            .reversed()
    }
}

#Preview {
    @State var color: Color = .white
    return SquareColorPicker3View(selectedColor: $color)
}
