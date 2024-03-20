//
//  ViewParamPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/6/24.
//

import SwiftUI

struct ViewParamPage: View {
    var content: (() -> any View)?
    init() {
         self.content = nil
    }
    init(@ViewBuilder content: @escaping () -> any View) {
         self.content = content
    }
    public var body: some View {
        VStack {
            if let content {
                AnyView(content())
            }
        }
    }
}

#Preview {
    ViewParamPage {
        Text("Test")
    }
}
