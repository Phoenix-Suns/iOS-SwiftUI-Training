//
//  SquareColorPicker2View.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/20/24.
//

import SwiftUI

struct SquareColorPicker2View: View {
    @Binding private var selectedColor: Color
    @State private var hue: Double = 0.5
    @State var saturation: Double = 0.5
    @State var lightness: Double = 0.5
    @State private var alpha: Double = 0.5
    
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
                DualAxisSlider(horizontal: $saturation, vertical: $lightness) {
                            ZStack {
                                AngularGradient(stops: [.init(color: Color(hue: 0, saturation: 0, brightness: 0.5), location: 0),
                                                        .init(color: Color(hue: hue, saturation: 1, brightness: 0.5), location: 1/8),
                                                        .init(color: Color(hue: 0, saturation: 0, brightness: 0.5), location: 1/4)
                                ], center: .bottomLeading, angle: .degrees(-90))
                                
                                LinearGradient(
                                    colors: [Color.black, Color.white],
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                                .blendMode(.overlay)
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

                HueSlider(hue: $hue)
                AlphaSlider(alpha: $alpha, color: selectedColor)
            }
            .onChange(of: colorChangeFlag) { _ in
                    selectedColor = Color(hue: hue, saturation: saturation, brightness: lightness, opacity: alpha)
            }
        }
}

extension SquareColorPicker2View {
    
}

#Preview {
    @State var color: Color = .white
    return SquareColorPicker2View(selectedColor: $color)
}
