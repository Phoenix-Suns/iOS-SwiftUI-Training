//
//  TestPullToRefreshPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 8/22/23.
//

import SwiftUI

struct TestPullToRefreshPage: View {
    @State var refreshed = false
    
    var body: some View {
        ScrollView {
            PullToRefreshView(coordinateSpaceName: "pullToRefresh") {
                // do your stuff when pulled
                withAnimation {
                    refreshed = true
                }
            }
            
            Text(refreshed ? "Refresed!" : "Pull Down to Refresh")
        }.coordinateSpace(name: "pullToRefresh")
    }
}

struct TestPullToRefreshPage_Previews: PreviewProvider {
    static var previews: some View {
        TestPullToRefreshPage()
    }
}
