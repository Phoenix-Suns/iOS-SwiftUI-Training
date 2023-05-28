//
//  LandmarkRow.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import SwiftUI

struct GridVerticalItem: View {
    var item: String
    
    var body: some View {
        Label(item, systemImage: "photo")
    }
}

struct GridVerticalItem_Previews: PreviewProvider {
    static var previews: some View {
        Grid {
            GridRow {
                GridVerticalItem(item: "Item 1")
            }
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
