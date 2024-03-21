//
//  CircleColorPicker1View.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/20/24.
//

import SwiftUI
import Combine

struct CircleColorPicker1View: View {
    /// Struct's private properties.
    @Binding private var selectedColor: Color
    @State private var isEdit: Bool = false
    @State private var hex: String = ""
    @State private var r: String = ""
    @State private var g: String = ""
    @State private var b: String = ""

    private let center: CGFloat = 0.5
    
    /// Struct's constructor.
    init(selectedColor: Binding<Color>) {
        self._selectedColor = selectedColor
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            colorWheel
                .frame(minHeight: 0, maxHeight: .infinity)
        }
        //.onReceive(colorPublisher) { color in
        .onChange(of: selectedColor, perform: { color in
            let (red, green, blue) = color.rgb
            hex = "#\(color.hex)"
            r = Int(red).description
            g = Int(green).description
            b = Int(blue).description
        })
    }
}

/// MARK - Child Views
private extension CircleColorPicker1View {
    var colorWheel: some View {
        GeometryReader { geometry in
            let paddingHorizontal: CGFloat = 5
            let paddingVertical: CGFloat = 5
            let frame = normalize(geometry.frame(in: .local), padding: paddingHorizontal)

            let inverseCoord = inverseToCoord()
            let coord = CGPoint(x: frame.width * inverseCoord.x - frame.midX,
                                y: frame.height * inverseCoord.y - frame.midY)

            ZStack {
                AngularGradientView()
                    .padding(5)
                    .overlay(Circle()
                        .stroke(selectedColor, lineWidth: 10)
                    )
                    .clipShape(Circle())

                Circle()
                    .fill(RadialGradient(colors: [.white, .white.opacity(0)], center: .center, startRadius: 0, endRadius: frame.height / 2))

                ZStack(alignment: .top) {
                    Circle()
                        .fill(selectedColor)
                        .frame(width: 32, height: 32)
                    Circle()
                        .strokeBorder(Color.black.opacity(0.5), lineWidth: 3)
                        .frame(width: 32, height: 32)
                }
                .scaleEffect(isEdit ? 1.5 : 1, anchor: .center)
                .offset(x: coord.x + paddingHorizontal, y: coord.y + paddingVertical)
            }
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged { value in
                        if !isEdit {
                            withAnimation {
                                isEdit = true
                            }
                        }

                        let coord = value.location
                        let normalizedCoord = CGPoint(x: (coord.x - frame.minX) / frame.width,
                                                      y: (coord.y - frame.minY) / frame.height)

                        let saturation: CGFloat = min(0.5, radius(normalizedCoord)) * 2
                        let hue: CGFloat = normalize(-angle(normalizedCoord)) / (.pi * 2)

                        self.selectedColor = Color(hue: hue, saturation: saturation, brightness: 1)
                    }
                    .onEnded { value in
                        withAnimation {
                            isEdit = false
                        }
                        let coord = value.location

                        let normalizedCoord = CGPoint(x: (coord.x - frame.minX) / frame.width,
                                                      y: (coord.y - frame.minY) / frame.height)

                        let saturation: CGFloat = min(0.5, radius(normalizedCoord)) * 2
                        let hue: CGFloat = normalize(-angle(normalizedCoord)) / (.pi * 2)

                        self.selectedColor = Color(hue: hue, saturation: saturation, brightness: 1)
                    }
            )
        }
        .aspectRatio(contentMode: .fit)
    }
}

/// MARK - Private funcs
private extension CircleColorPicker1View {
    func angle(_ normalizedCoord: CGPoint) -> CGFloat {
        return atan2(normalizedCoord.y - center,
                     normalizedCoord.x - center)
    }

    func radius(_ normalizedCoord: CGPoint) -> CGFloat {
        return hypot(normalizedCoord.x - center,
                     normalizedCoord.y - center)
    }

    func normalize(_ radian: CGFloat) -> CGFloat {
        let diameter: CGFloat = .pi * 2
        let reminder = radian.truncatingRemainder(dividingBy: diameter)

        let result = radian < 0.0 ? reminder + diameter : reminder
        return result
    }

    func normalize(_ frame: CGRect, padding: CGFloat) -> CGRect {
        return CGRect(x: padding, y: padding,
                      width: frame.width - (padding * 2),
                      height: frame.height - (padding * 2))
    }

    func inverseToCoord() -> CGPoint {
        let (h, s, _) = selectedColor.hsv
        let angle = h * .pi * -2
        let radius = s / 2

        return CGPoint(x: (radius * cos(angle)) + center,
                       y: (radius * sin(angle)) + center)
    }
}

#Preview {
    @State var color: Color = .white
    return CircleColorPicker1View(selectedColor: $color)
}
