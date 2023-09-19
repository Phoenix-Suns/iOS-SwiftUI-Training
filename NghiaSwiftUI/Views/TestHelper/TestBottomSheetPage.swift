//
//  TestBottomSheetPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 8/22/23.
//

import SwiftUI

struct TestBottomSheetPage: View {
    @State var bottomSheetOpen: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            Color.green
            BottomSheetView(
                isOpen: $bottomSheetOpen,
                minHeight: 100,
                maxHeight: geometry.size.height
            ) {
                Color.blue
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct TestBottomSheetPage_Previews: PreviewProvider {
    static var previews: some View {
        TestBottomSheetPage()
    }
}
