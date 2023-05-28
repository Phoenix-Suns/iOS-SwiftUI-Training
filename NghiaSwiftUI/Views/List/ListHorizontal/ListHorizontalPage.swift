//
//  ListVertical.swift
//  NghiaSwiftUI
//
//  Created by Nghia on 5/23/23.
//

import SwiftUI

struct ListHorizontalPage: View {
    let data = (1...1000).map { "Item \($0)" }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 0) {
                ForEach(data, id: \.self) { item in
                    ListHorizontalItem(item: item)
                }
            }
        }
        .frame(height: 100) // Height
        .navigationTitle("List Vertical")   // Nav title
    }
}

struct ListHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        ListVerticalPage()
    }
}
