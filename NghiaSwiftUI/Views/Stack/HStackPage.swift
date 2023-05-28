//
//  HStackPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 5/25/23.
//

import SwiftUI

struct HStackPage: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 10) {
                ColorBoxView(title: "100")
                    .frame(maxWidth: .infinity)
                ColorBoxView(title: "100")
                ColorBoxView(title: "100")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ColorBoxView: View {
    var title: String = ""
    var background: Color = Color.blue
    
    var body: some View {
        ZStack {
            Text(title)
        }
        .background(background)
    }
}

struct HStackPage_Previews: PreviewProvider {
    static var previews: some View {
        HStackPage()
    }
}
