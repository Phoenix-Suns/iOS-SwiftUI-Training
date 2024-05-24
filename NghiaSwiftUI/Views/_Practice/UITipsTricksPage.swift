//
//  UITipsTricksPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 4/1/24.
//

import SwiftUI

struct UITipsTricksPage: View {
    var body: some View {
        let text = Text("Gradient Text")
            .font(.system(size: 20, weight: .bold))
        text.foregroundColor(.clear)
            .overlay(
                LinearGradient(colors: [Color.blue, Color.green], startPoint: .leading, endPoint: .trailing)
                    .mask(text)
            )
    }
}

#Preview {
    UITipsTricksPage()
}
