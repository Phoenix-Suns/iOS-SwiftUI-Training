//
//  ListVertical.swift
//  NghiaSwiftUI
//
//  Created by Nghia on 5/23/23.
//

import SwiftUI

struct ListVerticalPage: View {
    let data = (1...1000).map { "Item \($0)" }

    var body: some View {
            List {
                // Filtered List View
                ForEach(data, id: \.self) { item in
                    ListVerticalRow(item: item)
                }
            }
            .navigationTitle("List Vertical")   // Nav title
        }
}

struct ListVertical_Previews: PreviewProvider {
    static var previews: some View {
        ListVerticalPage()
    }
}
