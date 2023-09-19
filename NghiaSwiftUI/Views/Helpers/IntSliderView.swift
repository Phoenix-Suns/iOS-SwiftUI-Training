//  File name   : IntSliderView.swift
//
//  Author      : Nghia Tran
//  Created date: 6/1/23
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2023 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import SwiftUI

struct IntSliderView: View {
    
    var body: some View {
        GeometryReader { geometry in
            let x = (geometry.size.width - 20) * CGFloat(valueToPercent(value) / 100)
            // 20 = padding horizontal

            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 5)
                    .foregroundColor(backgroundColor)
                    .cornerRadius(10)
                Rectangle()
                    .frame(height: 5)
                    .foregroundColor(.accentColor)
                    .cornerRadius(10)
                    .frame(width: x)
                Circle()
                    .foregroundColor(Color.white)
                    .offset(x: max(x, 0), y: 0)
            }
            .padding(.horizontal, 10)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                    self.value = Int(Float(minValue) + (Float(maxValue - minValue) * percentage / 100))
                })
        }
    }

    /// Struct's private properties.
    @Binding var value: Int
    var minValue: Int = 0
    var maxValue: Int = 100
    var backgroundColor: Color = .gray
}

// MARK: - Private Functions
extension IntSliderView {
    private func valueToPercent(_ value: Int) -> Float {
        return Float(value - minValue) * 100 / Float(maxValue - minValue)
    }
}

struct IntSliderView_Previews: PreviewProvider {
    static var previews: some View {
        IntSliderView(value: .constant(5))
            .accentColor(.secondary)
            .frame(width: 300, height: 20)
    }
}
