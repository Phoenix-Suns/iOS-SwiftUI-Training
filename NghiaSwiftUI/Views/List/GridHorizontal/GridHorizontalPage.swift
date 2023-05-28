//
//  GridHorizontal.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 5/24/23.
//

import SwiftUI

struct GridHorizontalPage: View {
    let data = (1...1000).map { "Item \($0)" }
    
    // Rows Config (3 Rows)
    let rows = [
        //GridItem(.adaptive(minimum: 100)),
        //GridItem(.fixed(100)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    // Item View
                    //Text(item)
                    GridHorizontalItem(item: item)
                }
            }
            .padding(.horizontal)
            .frame(height: 500) // Height
        }
    }
}

struct GridHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        GridHorizontalPage()
    }
}
