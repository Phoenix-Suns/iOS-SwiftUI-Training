//
//  TestHalfHeartShape.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 7/22/24.
//

import SwiftUI

struct TestHalfHeartShape: View {
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .clipShape(HalfHeartShape()) // Clip to a half-heart shape
            .overlay(
                HalfHeartShape()
                    .stroke(Color.red, lineWidth: 5) // Add a stroke to the half-heart shape
                    .frame(width: 200, height: 200)
            )
    }
}

#Preview {
    TestHalfHeartShape()
}
