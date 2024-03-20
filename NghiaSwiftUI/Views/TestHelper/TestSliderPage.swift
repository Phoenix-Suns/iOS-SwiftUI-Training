//
//  TestSliderPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 10/19/23.
//

import SwiftUI

struct TestSliderPage: View {
    var body: some View {
        VStack {
            Text("\(sliderValue)")
            SliderView(value: $sliderValue, minValue: .constant(0), maxValue: .constant(100), thumbColor: .red, minTrackColor: .green, maxTrackColor: .green)
                .frame(width: 300, height: 20)
        }
    }
    
    @State var sliderValue: Double = 100
}

#Preview {
    TestSliderPage()
}
