//
//  AsyncTaskPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 8/30/24.
//

import SwiftUI

struct AsyncTaskPage: View {
    @State private var displayStr: String = "Current Time"
    @State private var counter: Int = 0
    
    var body: some View {
        VStack {
            Text("Time: \(displayStr)")
                .font(.largeTitle)
            
            Button(action: {
                wait(second: 3)
            }, label: {
                Text("Wait 3s")
            })
            .buttonStyle(BorderedButtonStyle())
            
            Button(action: {
                self.countdown(second: 5)
            }, label: {
                Text("Count down 5s")
            })
            .buttonStyle(BorderedButtonStyle())
        }
    }
    
    func wait(second: Int) {
        // 1 second = 1_000_000_000 nanoseconds
        let nanoSeconds: UInt64 = UInt64(second) * 1_000_000_000
        Task {
            displayStr = "Waiting..."
            try? await Task.sleep(nanoseconds: nanoSeconds)
            displayStr = "Complete"
        }
    }
    
    func countdown(second: Int) {
        self.counter = 5
        startCountdown()
    }
    
    func startCountdown() {
        // 1 second = 1_000_000_000 nanoseconds
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            counter -= 1
            displayStr = "\(counter)"
            
            // End countdown
            if counter > 0 {
                startCountdown()
            }
        }
    }
}

#Preview {
    AsyncTaskPage()
}
