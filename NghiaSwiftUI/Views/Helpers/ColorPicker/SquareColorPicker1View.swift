//
//  SquareColorPicker1View.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/20/24.
//

import SwiftUI

struct SquareColorPicker1View: View {
    @Binding private var selectedColor: Color
    let colors: [Color] = SquareColorPicker1View.spectrum()
    let colorSize: CGFloat = 30
    let widthItemCount: CGFloat = 10
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 10)
    
    /// Struct's constructor.
    init(selectedColor: Binding<Color>) {
        self._selectedColor = selectedColor
    }
    
    var body: some View {
        GeometryReader(content: { geo in
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(colors, id: \.self) { color in
                    ZStack {
                        if color.isEqual(color: selectedColor) {
                            color
                                .border(.white.opacity(0.8), width: 4)
                                .shadow(radius: 4)
                        } else {
                            color
                        }
                    }
                    .frame(height: geo.size.width/widthItemCount)
                    .id(color)
                    .onTapGesture {
                        selectedColor = color
                    }
                }
                
            }
        })
    }
}

extension SquareColorPicker1View {
    static func spectrum() -> [Color] {
        let brightnessDistance = 0.2
        let hueDistance = 0.1
        let brightnessValues = Array(stride(from: 0.2,
                                            through: 1.0,
                                            by: brightnessDistance))
        let hueValues = Array(stride(from: 0.0,
                                     through: 1.0,
                                     by: hueDistance))
        
        var results = [Color]()
        
        for hueValue in hueValues {
            // White to Color
            let row = brightnessValues.map {
                Color(hue: hueValue,
                      saturation: 1,
                      brightness: round1Decimal(number: $0))
            }
            results.append(contentsOf: row)
            
            // Color to Black
            let rowEnd = brightnessValues.map {
                Color(hue: hueValue,
                      saturation: round1Decimal(number: $0),
                      brightness: 1)
            }.reversed().dropFirst()
            results.append(contentsOf: rowEnd)
            
            // Black & White
            let color = Color(hue: 0, saturation: 0, brightness: hueValue + hueDistance)
            results.append(color)
        }

       return results
    }
    
    static func round1Decimal(number: Double) -> Double {
        return Double(Int(number*10))/10
    }
}

extension Color {
    func isEqual(color: Color) -> Bool {
        let components1 = self.components
        let components2 = color.components
        
        return components1.red == components2.red &&
        components1.green == components2.green &&
        components1.blue == components2.blue &&
        components1.opacity == components2.opacity
    }
    
    var components: (red: Double, green: Double, blue: Double, opacity: Double) {
        let uiColor = UIColor(self)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (Double(red), Double(green), Double(blue), Double(alpha))
    }
}

#Preview {
    @State var color: Color = .white
    return SquareColorPicker1View(selectedColor: $color)
}
