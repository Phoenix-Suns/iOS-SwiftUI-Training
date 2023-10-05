//
//  TestPagerDotPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 7/26/23.
//

import SwiftUI

struct TestPagerDotPage: View {
    var body: some View {
        PagerWithDotsView(["one", "two", "three"]) { item in
            VStack {
                Text(item)
                    .font(.system(size: 150))
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.random)
        }
    }
}

struct TestPagerDotPage_Previews: PreviewProvider {
    static var previews: some View {
        TestPagerDotPage()
    }
}
