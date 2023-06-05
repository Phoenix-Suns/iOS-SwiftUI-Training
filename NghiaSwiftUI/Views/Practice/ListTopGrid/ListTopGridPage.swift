//
//  ListTopGridPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 6/5/23.
//

import SwiftUI

struct ListTopGridPage: View {
    let gridData = (1...1000).map { "Item \($0)" }
    let listData = (1...1000).map { "Item \($0)" }
    
    // Column Config (3 Column)
    let columns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        //GridItem(.flexible(minimum: 80)),
        //GridItem(.fixed(80))
    ]
    
    var body: some View {
        ScrollView {
            Text("List Header")
                .font(.title3)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    ForEach(listData, id: \.self) { item in
                        ListHorizontalItem(item: item)
                    }
                }
            }
            //.frame(height: 100) // Height
            Text("Grid Header")
                .font(.title3)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding()
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(gridData, id: \.self) { item in
                    // Item View
                    //Text(item)
                    GridVerticalItem(item: item)
                }
            }
            .padding(.horizontal)
        }
        // Height
        //.frame(height: 500)
    }
}

struct ListTopGridPage_Previews: PreviewProvider {
    static var previews: some View {
        ListTopGridPage()
    }
}
