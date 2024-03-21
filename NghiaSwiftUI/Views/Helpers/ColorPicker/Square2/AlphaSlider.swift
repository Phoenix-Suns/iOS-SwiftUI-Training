//
//  AlphaSlider.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/21/24.
//

import SwiftUI

struct AlphaSlider: View {
    @Binding var alpha: Double
       var color: Color

       var body: some View {
           CustomSlider(value: $alpha) {
               CheckerBoardBackground(numberOfRows: 4)
                   .overlay {
                       LinearGradient(
                           colors: [
                               color.opacity(0),
                               color,
                           ],
                           startPoint: .leading,
                           endPoint: .trailing
                       )
                   }
                   .drawingGroup()
           } thumb: {
               Circle()
                   .fill(Color.white)
                   .overlay {
                       Circle()
                           .fill(color.opacity(alpha))
                   }
                   .overlay {
                       Circle()
                           .strokeBorder(Color.white, lineWidth: 2)
                   }
                   .shadow(radius: 0.5)
                   .padding(2)
           }
           .frame(height: 24)
       }
}

#Preview {
    return AlphaSlider(
        alpha: .constant(0.5),
        color: .red
    )
    .frame(width: 320, height: 32)
}
