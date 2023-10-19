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
            IntSliderView(value: $sliderValue)
            IntSliderView(value: .constant(50))
        }
        .background(Color.gray)
    }
    
    @State var sliderValue: Int = 0
}

#Preview {
    TestSliderPage()
}
