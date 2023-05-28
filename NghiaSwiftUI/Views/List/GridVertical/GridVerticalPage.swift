//
//  GridVertical.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 5/24/23.
//

import SwiftUI

struct GridVerticalPage: View {
    let data = (1...1000).map { "Item \($0)" }
    
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
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
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

struct GridVertical_Previews: PreviewProvider {
    static var previews: some View {
        GridVerticalPage()
    }
}
