//  File name   : MarqueeText3.swift
//
//  Author      : Nghia Tran
//  Created date: 25/07/2023
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2023 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import Combine
import SwiftUI

struct MarqueeText3: View {
    var body: some View {
        GeometryReader { gp in
            VStack {
                Text(text)
                    .font(.system(size: self.fontSize))
                    .fixedSize()
                    .frame(width: gp.size.width + textWidth, alignment: .leading)
                    .offset(x: self.x)
            }
            .onAppear {
                self.textWidth = textSize(text, fontSize: fontSize)
                active = textWidth > gp.size.width
            }
            .onChange(of: text, perform: { newValue in
                self.textWidth = textSize(newValue, fontSize: fontSize)
                active = textWidth > gp.size.width
                x = 0
            })
            .onReceive(timer, perform: { _ in
                updateTextPosition()
            })
        }.fixedSize(horizontal: false, vertical: true)
    }

    /// Struct's public properties.
    @Binding private var text: String
    private var fontSize: CGFloat
    private var speed: CGFloat = 3

    /// Struct's constructors.
    init(_ text: Binding<String>, fontSize: CGFloat, speed: CGFloat = 3) {
        self._text = text
        self.fontSize = fontSize
        self.speed = speed
        
        self.timer = Timer.publish(every: tick, on: .main, in: .common).autoconnect()
    }
    

    /// Struct's private properties.
    @State private var active = false
    @State private var textWidth: CGFloat = 0
    @State private var x: CGFloat = 0
    private let tick: TimeInterval = 1 / 30
    private let timer: Publishers.Autoconnect<Timer.TimerPublisher>
}

// MARK: - ScanAnimationView's preview
private extension MarqueeText3 {
    func textSize(_ text: String, fontSize: CGFloat) -> CGFloat {
        let font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        return (text as NSString).size(withAttributes: [.font: font]).width
    }

    func updateTextPosition() {
        if active {
            if -x < textWidth {
                x -= speed
            } else {
                x = textWidth / 2
            }
        }
    }
}

struct MarqueeText3_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            MarqueeText3(.constant("dfgdg dfg fdg"), fontSize: 20)
            MarqueeText3(.constant("sfsdfas sdf sdf dsf adsfsatgeryt yt ytru ytr"), fontSize: 20)
        }
    }
}
