//  File name   : IntSlider2View.swift
//
//  Author      : Nghia Tran
//  Created date: 6/1/23
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2023 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import SwiftUI

struct IntSlider2View: View {
    
    var body: some View {
        GeometryReader { geometry in
            //let x = (geometry.size.width - 20) * CGFloat(valueToPercent(value) / 100)
            // 20 = padding horizontal

            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 5)
                    .foregroundColor(barColor)
                    .cornerRadius(10)
                Circle()
                    .frame(width: circleWidth, height: circleWidth)
                    .foregroundColor(Color.white)
                    //.offset(x: self.x - 20, y: 0)
                    .offset(x: self.x - self.circleWidth, y: 0)
            }
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { value in
//                    let percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
//                    self.value = Int(Float(minValue) + (Float(maxValue - minValue) * percentage / 100))
                    
                    let totalWidth = geometry.size.width
                    if value.location.x <= totalWidth-10 && value.location.x >= 0{
                        self.x = value.location.x
                    }
                })
        }
    }

    /// Struct's private properties.
//    @Binding var value: Int
    @State var value: Int = 0
    @State var x: CGFloat = 0
    var minValue: Int = 0
    var maxValue: Int = 100
    var barColor: Color = .gray
    var circleWidth: CGFloat = 30
}

// MARK: - Private Functions
extension IntSlider2View {
    private func valueToPercent(_ value: Int) -> Float {
        return Float(value - minValue) * 100 / Float(maxValue - minValue)
    }
}

struct IntSlider2View_Previews: PreviewProvider {
    static var previews: some View {
        //IntSlider2View(value: .constant(5))
        IntSlider2View(value: 50, minValue: 10, maxValue: 90, barColor: .red)
            .background(.gray)
            .frame(width: 300)
    }
}
