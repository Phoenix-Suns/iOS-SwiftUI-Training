//
//  TestHeaderScrollView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 7/22/24.
//

import SwiftUI

struct TestHeaderScrollView: View {
    @State private var selectedIndex = 0
    @State private var toTop = false
    
    var body: some View {
        HeaderScrollView(toTop: $toTop) {
            VStack {
                headerView
                tabView
            }
            .background(Color.white)
            .zIndex(1.0)
        } content: {
            switch selectedIndex {
            case 0:
                content1
                    .zIndex(-1)
            case 1:
                content2
                    .zIndex(-1)
            default:
                content3
                    .zIndex(-1)
            }
        }
    }
    
    
    var data: [String] = Array(0...100).map { item in
        String(item)
    }
    
    @ViewBuilder var headerView: some View {
        Image(systemName: "photo.artframe")
            .resizable()
            .frame(height: UIScreen.main.bounds.height / 2.3)
    }
    
    @ViewBuilder var tabView: some View {
        HStack {
            Button(action: {
                selectedIndex = 0
                toTop = true
            }, label: {
                Text("Tab 1")
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(selectedIndex == 0 ? Color.green.opacity(0.3) : Color.clear)
            })
            
            Button(action: {
                selectedIndex = 1
                toTop = true
            }, label: {
                Text("Tab 2")
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(selectedIndex == 1 ? Color.green.opacity(0.3) : Color.clear)
            })
            
            Button(action: {
                selectedIndex = 2
                toTop = true
            }, label: {
                Text("Tab 3")
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(selectedIndex == 2 ? Color.green.opacity(0.3) : Color.clear)
            })
        }
        .background(Color.gray.opacity(0.3))
    }
    
    @ViewBuilder var content1: some View {
        ForEach(data, id: \.self) { item in
            ItemView(data: item)
        }
        .background(Color.blue)
    }
    
    @ViewBuilder var content2: some View {
        ForEach(data, id: \.self) { item in
            ItemView(data: item)
        }
        .background(Color.red)
    }
    
    @ViewBuilder var content3: some View {
        ForEach(data, id: \.self) { item in
            ItemView(data: item)
        }
        .background(Color.green)
    }
}

struct ItemView: View {
    var data: String
    
    var body: some View {
        Text(data)
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}

#Preview {
    TestHeaderScrollView()
}
