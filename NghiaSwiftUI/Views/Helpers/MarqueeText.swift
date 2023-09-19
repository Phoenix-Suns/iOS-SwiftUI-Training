//  File name   : MarqueeText.swift
//
//  Author      : Nghia Tran
//  Created date: 25/07/2023
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2023 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import Combine
import SwiftUI

struct MarqueeText: View {
    var body: some View {
        GeometryReader { gp in
            VStack {
                Text(text)
                    .font(.system(size: self.fontSize))
                    .fixedSize()
                    //.clipped()    // not working
                    //.frame(width: gp.size.width + textWidth, height: 50, alignment: .leading) // not working
                    .frame(width: gp.size.width + textWidth, alignment: .leading)
                    .id(active)
                    .transition(transition)
                    .animation(active ? animation : Animation.default, value: active)
            }
            .onAppear {
                // flying
//                self.textWidth = textSize(text, fontSize: fontSize)
                //active = textWidth > gp.size.width
                self.active.toggle()
            }
            .onChange(of: text, perform: { newValue in
                self.textWidth = textSize(newValue, fontSize: fontSize)
                active = textWidth > gp.size.width
            })
        }.fixedSize(horizontal: false, vertical: true)
    }

    /// Struct's public properties.
    @Binding private var text: String
    private var fontSize: CGFloat

    /// Struct's constructors.
    init(_ text: Binding<String>, fontSize: CGFloat) {
        self._text = text
        self.fontSize = fontSize
        
        self._textWidth = State(initialValue: textSize(text.wrappedValue, fontSize: fontSize))
        //self.active = true
    }

    /// Struct's private properties.
    @State private var active = false
    @State private var textWidth: CGFloat = 0
    private let animation = Animation.linear(duration: 5).repeatForever(autoreverses: false)
    private let transition = AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
}

// MARK: - ScanAnimationView's preview
private extension MarqueeText {
    func textSize(_ text: String, fontSize: CGFloat) -> CGFloat {
        let font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        return (text as NSString).size(withAttributes: [.font: font]).width
    }
}

struct MarqueeText_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MarqueeText(.constant("dfgdg dfg fdg"), fontSize: 20)
            MarqueeText(.constant("sfsdfas sdf sdf dsf adsfsatgeryt yt ytru ytr"), fontSize: 20)
        }
    }
}
