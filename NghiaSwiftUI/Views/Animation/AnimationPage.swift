//
//  AnimationPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 5/25/23.
//

import SwiftUI

struct AnimationPage: View {
    @State private var isChange = false
    
    var body: some View {
        VStack {
            Text("Debug: isChange = \(String(isChange))")
            
            Button("Run Animation") {
                // ===== Run Animation =====
                withAnimation(.spring()) {
                    self.isChange.toggle()
                }
            }
            .buttonStyle(.bordered)
            .font(.title)
            
            Spacer()
            
            if isChange {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
                    .frame(width: 200, height: 200)
                
                    // === Set Animation Type ===
                    .transition(.scale(scale: 2))
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .frame(width: 200, height: 200)
            
                // === Animation without withAnimation ===
                .rotationEffect(isChange ? .degrees(40) : .degrees(0))
                .scaleEffect(isChange ? 1.2 : 1)
        }
        .padding()
    }
}

struct AnimationPage_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPage()
    }
}
