//
//  TestToastPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 10/2/23.
//

import SwiftUI

struct TestToastPage: View {
    @State private var showToast = false
    
    var body: some View {
        ToastView(isShowing: $showToast, content: {
            Button(action: {
                showToast = !showToast
            }, label: {
                Text("Switch Toast")
            })
            .background(Color.blue)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }, text: Text("Toast Value"))
    }
}

#Preview {
    TestToastPage()
}
