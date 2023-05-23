//
//  TabView.swift
//  NghiaSwiftUI
//
//  Created by Nghia on 5/23/23.
//

import SwiftUI

struct Tab: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        //LandmarkList()
        
        // TAB UI
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
            .environmentObject(ModelData())
    }
}
