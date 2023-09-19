//
//  LongPressHandle.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 6/27/23.
//

import Combine
import Foundation
import SwiftUI

class LongPressHandle {
    enum PressStatus {
        case Press
        case LongPressDown
        case LongPressRelease
    }
    
    init(pressStatus: @escaping (PressStatus) -> ()) {
        self.pressStatus = pressStatus
    }
    
    deinit {
        debugPrint("LongPressHandle deinit")
    }
    
    public var pressStatus: (PressStatus) -> ()
    private var holdingTime = 0.2 // second
    private var isHolding = false
    private var isLongPress = false
    private var holdingTimer: Timer? = nil
    
    func createGesture() -> _EndedGesture<_ChangedGesture<DragGesture>> {
        return DragGesture(minimumDistance: 0)
            .onChanged { [weak self] _ in
                if self?.isHolding == false {
                    self?.isHolding = true
                    self?.isLongPress = false
                    self?.startHoldingTimer()
                }
            }
            .onEnded { [weak self] _ in
                self?.isHolding = false
                self?.stopHoldingTimer()
                
                if self?.isLongPress == true {
                    self?.pressStatus(PressStatus.LongPressRelease)
                } else {
                    self?.pressStatus(PressStatus.Press)
                }
                self?.isLongPress = false
            }
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
}

