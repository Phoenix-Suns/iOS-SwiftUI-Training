//
//  TestLoadingViewPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 7/26/23.
//

import SwiftUI

struct TestLoadingViewPage: View {
    var body: some View {
        LoadingView(isShow: true) {
            Text("Big Content, Big Content, Big Content ,Big Content, Big Content, Big Content")
                .font(.largeTitle)
        } loadingContent: {
            Text("Loading...")
                .font(.largeTitle)
        }
    }
}

struct TestLoadingViewPage_Previews: PreviewProvider {
    static var previews: some View {
        TestLoadingViewPage()
    }
}
