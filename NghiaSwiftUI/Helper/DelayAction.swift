//  File name   : DelayAction.swift
//
//  Author      : Nghia Tran
//  Created date: 9/28/23
//  Version     : 1.00
//  --------------------------------------------------------------
//  
//  --------------------------------------------------------------

import Foundation

class DelayAction {
    /// Struct's public properties.
    var delayTime = 1 // Second
    //@CancellableBag private var bag
    private var timer: Timer?
    private var onFinish: (() -> Void)?
    
    /// Struct's private properties.
    
    func start(delayTime: Int? = nil, onFinish: @escaping () -> Void) {
        self.delayTime = delayTime ?? self.delayTime
        self.onFinish = onFinish
        
//        Timer.publish(every: 1, on: .main, in: .common)
//            .autoconnect()
//            .prefix(threshold)
//            .sink(receiveValue: weakify(code: { _, wSelf in
//
//            }))
//            .store(in: &bag)
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(self.delayTime), repeats: false) {[weak self] _ in
            self?.onFinish?()
        }
    }
    
    func cancel() {
        if timer?.isValid == true {
            timer?.invalidate()
        }
    }
}
