//
//  ToastView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 10/2/23.
//

import SwiftUI

struct ToastView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    let content: () -> Content
    let text: Text
    let delay: TimeInterval = 2

    var body: some View {
        if self.isShowing {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                withAnimation {
                    self.isShowing = false
                }
            }
        }
        
        return GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                
                self.content()
                    //.blur(radius: self.isShowing ? 1 : 0)

                VStack {
                    self.text
                }
                .padding(5)
                .frame(width: geometry.size.width / 1.25)
                .background(Color.gray)
                .foregroundColor(Color.secondary)
                .cornerRadius(20)
                .transition(.slide)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }
}


#Preview {
    ToastView(isShowing: .constant(true), content: {
        Button(action: {
            
        }, label: {
            Text("Switch Toast")
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }, text: Text("Toast Value"))
}
