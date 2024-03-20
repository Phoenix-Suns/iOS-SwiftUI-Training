//  File name   : SliderView.swift
//
//  Author      : Nghia Tran
//  Created date: 08/14/23
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2023 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import SwiftUI

struct SliderView: View {
    var body: some View {
        let positionValue = (self.editingChanged ? self.slideValue : self.value) ?? 0

        if positionValue >= minValue && positionValue <= maxValue {
            GeometryReader { geometry in
                let x = geometry.size.width * CGFloat(valueToPercent(positionValue) / 100)

                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: self.trackHeight)
                        .foregroundColor(self.maxTrackColor)
                    Rectangle()
                        .foregroundColor(self.isEnabled ? self.minTrackColor : .gray)
                        .frame(height: self.trackHeight)
                        .frame(width: x)
                    Circle()
                        .frame(width: self.thumbHeight, height: self.thumbHeight)
                        .foregroundColor(self.isEnabled ? self.thumbColor : Color.gray)
                        .offset(x: max(x - thumbHeight / 2, 0), y: 0)
                }
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        if self.isEnabled {
                            let percentage: Double = min(max(0.0, Double(value.location.x / geometry.size.width * 100)), 100.0)
                            self.slideValue = minValue + (maxValue - minValue) * percentage / 100
                            self.value = self.slideValue!
                        }

                        if self.editingChanged != true {
                            self.editingChanged = true
                            self.onEditingChanged(true)
                        }
                    }.onEnded { value in
                        self.slideValue = nil

                        if self.editingChanged != false {
                            self.editingChanged = false
                            self.onEditingChanged(false)
                        }
                    }
                )
            }
        } else {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: self.trackHeight)
                    .foregroundColor(self.maxTrackColor)
                Circle()
                    .frame(width: self.thumbHeight, height: self.thumbHeight)
                    .foregroundColor(Color.gray)
            }
            .frame(height: self.thumbHeight)
        }
    }

    /// Struct's public properties.
    @Binding var value: Double
    @State var slideValue: Double? = nil
    @Binding var minValue: Double
    @Binding var maxValue: Double
    var thumbColor: Color
    var thumbHeight: CGFloat
    var minTrackColor: Color
    var maxTrackColor: Color
    var trackHeight: CGFloat
    var onEditingChanged: (Bool) -> Void
    @Environment(\.isEnabled) var isEnabled

    init(value: Binding<Double>, minValue: Binding<Double>, maxValue: Binding<Double>, thumbColor: Color = .white, thumbHeight: CGFloat = 20, minTrackColor: Color = .gray, maxTrackColor: Color = .gray, trackHeight: CGFloat = 5, onEditingChanged: @escaping (Bool) -> Void = { _ in }) {
        self._value = value
        self._minValue = minValue
        self._maxValue = maxValue
        self.thumbColor = thumbColor
        self.thumbHeight = thumbHeight
        self.minTrackColor = minTrackColor
        self.maxTrackColor = maxTrackColor
        self.trackHeight = trackHeight
        self.onEditingChanged = onEditingChanged
    }

    /// Struct's private properties.
    @State private var editingChanged: Bool = false
}

// MARK: - Private Functions
extension SliderView {
    private func valueToPercent(_ value: Double) -> Double {
        guard maxValue > minValue else { return 0 }
        return Double(value - minValue) * 100 / Double(maxValue - minValue)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(5.0), minValue: .constant(0), maxValue: .constant(100), thumbColor: .red, minTrackColor: .green, maxTrackColor: .blue)
            .frame(width: 300, height: 20)
            .background(Color.blue)

        // Value > max value
        SliderView(value: .constant(110.0), minValue: .constant(0), maxValue: .constant(100), thumbColor: .red, minTrackColor: .green, maxTrackColor: .green)
            .frame(width: 300, height: 20)
            .background(Color.blue)

        // Disable
        SliderView(value: .constant(50.0), minValue: .constant(0), maxValue: .constant(100), thumbColor: .red, minTrackColor: .green, maxTrackColor: .blue)
            .frame(width: 300, height: 20)
            .background(Color.blue)
            .disabled(true)
    }
}
