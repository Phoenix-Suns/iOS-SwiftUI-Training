//
//  LandmarkRow.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import SwiftUI

struct GridHorizontalItem: View {
    var item: String
    
    var body: some View {
        Label(item, systemImage: "photo")
    }
}

struct GridHorizontalItem_Previews: PreviewProvider {
    static var previews: some View {
        Grid {
            GridRow {
                GridHorizontalItem(item: "Item 1")
            }
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
