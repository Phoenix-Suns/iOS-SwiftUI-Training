//
//  ButtonPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 6/26/23.
//

import SwiftUI
import Combine

struct ButtonPage: View {
    @State private var pressStatus = "IDLE"
    
    var body: some View {
        ScrollView {
            VStack {
                Button("Button automatic") { }
                    .buttonStyle(.automatic)
                Button("Button bordered") {}
                    .buttonStyle(.bordered)
                Button("Button borderedProminent") {}
                    .buttonStyle(.borderedProminent)
                Button("Button borderless") {}
                    .buttonStyle(.borderless)
                Button("Button plain") {}
                    .buttonStyle(.plain)
                
                HStack {
                    LongPressView {
                        Button("Long Press") {}
                        //.buttonStyle(.borderedProminent)
                    } pressStatus: { status in
                        switch status {
                        case .Press:
                            pressStatus = "Normal Press"
                        case .LongPressDown:
                            pressStatus = "Long Press Down"
                        case .LongPressRelease:
                            pressStatus = "Long Press Up"
                        }
                    }
                    Spacer()
                    Text(pressStatus)
                        .font(.title2)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.3))
            }
        }
    }
}

struct ButtonPage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPage()
    }
}
