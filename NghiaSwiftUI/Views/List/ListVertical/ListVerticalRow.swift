//
//  LandmarkRow.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import SwiftUI

struct ListVerticalRow: View {
    var item: String
    
    var body: some View {
        Label(item, systemImage: "tray.full.fill")
            .padding()
    }
}

struct ListVerticalRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            ListVerticalRow(item: "Item 1")
            ListVerticalRow(item: "Item 2")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
