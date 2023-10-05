//
//  TestPagerDotPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 7/26/23.
//

import SwiftUI

struct TestSwipeViewPage: View {
    var items = ["one", "two", "three", "4", "5", "6"]
    @State private var index = 0
    
    var body: some View {
//        PagerWithDotsView(items) { item in
//            VStack {
//                Text(item)
//                    .font(.system(size: 150))
//            }
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//            .background(Color.random)
//        }
        
        SwipeView(total: items.count) { width, height in
            LazyHStack(spacing: 0) {
                // render content
                ForEach(items, id: \.self) { elem in
                    Text("Index: \(elem)")
                        .frame(width: width, height: height)
                        .border(Color.red)
                }
            }
            .background(Color.blue)
        } indexChange: { i in
            withAnimation(.easeInOut) {
                index = i
                debugPrint(">>>", index)
            }
        }

    }
}

struct TestSwipeViewPage_Previews: PreviewProvider {
    static var previews: some View {
        TestSwipeViewPage()
    }
}
