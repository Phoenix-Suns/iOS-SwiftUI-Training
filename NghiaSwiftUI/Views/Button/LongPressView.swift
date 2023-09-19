//
//  LongPressView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 6/27/23.
//

import SwiftUI
import Combine

/**
 LongPressView {
     Button("Long Press") {}
     .buttonStyle(.borderedProminent)
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
 */
struct LongPressView<Content: View>: View {
    var body: some View {
        content
        .simultaneousGesture(DragGesture(minimumDistance: 0)
            .onChanged { _ in
                if !self.isHolding {
                    self.isHolding = true
                    self.isLongPress = false
                    startHoldingTimer()
                }
            }
            .onEnded { _ in
                self.isHolding = false
                stopHoldingTimer()

                if isLongPress {
                    self.pressStatus(PressStatus.LongPressRelease)
                } else {
                    self.pressStatus(PressStatus.Press)
                }
                self.isLongPress = false
            })
    }
    
    public var content: Content
    public var pressStatus: (PressStatus) -> ()
    private var holdingTime = 0.2 // second
    @State private var isHolding = false
    @State private var isLongPress = false
    @State private var holdingTimer: Timer? = nil
    
    init(content: @escaping () -> (Content), pressStatus: @escaping (PressStatus) -> ()) {
        self.content = content()
        self.pressStatus = pressStatus
    }
    
    private func stopHoldingTimer() {
        self.holdingTimer?.invalidate()
        self.holdingTimer = nil
    }
    
    private func startHoldingTimer() {
        self.holdingTimer = Timer.scheduledTimer(withTimeInterval: holdingTime, repeats: true, block: { timer in
            self.isLongPress = true
            self.pressStatus(PressStatus.LongPressDown)
        })
    }
    
    enum PressStatus {
        case Press
        case LongPressDown
        case LongPressRelease
    }
}

struct LongPressView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressView(content: {
            Text("Nghia")
        }) { status in
            
        }
    }
}
