//
//  TestDelayAction.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 9/28/23.
//

import SwiftUI

struct TestDelayAction: View {
    var delayAction = DelayAction()
    @State var message: String = "Click Start"
    
    var body: some View {
        VStack(spacing: 100) {
            Text(message)
            Button("Start") {
                message = "Processing..."
                delayAction.start(delayTime: 3, onFinish: {
                    message = "Finish"
                })
            }
            Button("Cancel") {
                delayAction.cancel()
                message = "Cancel. Click Start"
            }
        }
    }
}

struct TestDelayAction_Previews: PreviewProvider {
    static var previews: some View {
        TestDelayAction()
    }
}
