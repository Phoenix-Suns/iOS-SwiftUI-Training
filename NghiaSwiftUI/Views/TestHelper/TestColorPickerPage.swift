//
//  TestColorPickerPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/20/24.
//

import SwiftUI

struct TestColorPickerPage: View {
    @State private var selectedColor: Color = .gray
    
    var body: some View {
        VStack {
            Text("Selected Color")
                .padding(20)
                .background(
                    Rectangle()
                        .foregroundColor(selectedColor)
                )
            
            ScrollView {
                VStack(spacing: 24) {
                    CircleColorPicker1View(selectedColor: $selectedColor)
                        .frame(width: 200, height: 200)
                        .border(.gray, width: 1)
                    
                    SquareColorPicker1View(selectedColor: $selectedColor)
                        .frame(width: 200, height: 200)
                        .border(.gray, width: 1)
                    
                    SquareColorPicker2View(selectedColor: $selectedColor)
                        .frame(width: 200, height: 200)
                        .border(.gray, width: 1)
                    
                    SquareColorPicker3View(selectedColor: $selectedColor)
                        .frame(width: 200, height: 200)
                        .border(.gray, width: 1)
                    
                    RingColorPickerView(selectedColor: $selectedColor)
                        .frame(width: 200, height: 200)
                        .border(.gray, width: 1)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    TestColorPickerPage()
}
