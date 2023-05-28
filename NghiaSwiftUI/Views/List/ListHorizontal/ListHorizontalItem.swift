//
//  LandmarkRow.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import SwiftUI

struct ListHorizontalItem: View {
    var item: String
    
    var body: some View {
        Label(item, systemImage: "tray.full.fill")
            .padding()
    }
}

struct ListHorizontalItem_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            ListHorizontalItem(item: "Item 1")
            ListHorizontalItem(item: "Item 2")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
