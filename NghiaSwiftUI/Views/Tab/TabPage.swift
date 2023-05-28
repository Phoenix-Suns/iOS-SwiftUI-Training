//
//  TabView.swift
//  NghiaSwiftUI
//
//  Created by Nghia on 5/23/23.
//

import SwiftUI

struct TabPage: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        //LandmarkList()
        
        // TAB UI
        TabView(selection: $selection) {
            // View
            Text("Tab 1 Content")
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            Text("Tab 2 Content")
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabPage()
            .environmentObject(ModelData())
    }
}
