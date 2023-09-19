//
//  TestMarqueePage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 7/26/23.
//

import SwiftUI

struct TestMarqueePage: View {
    
    private let textList = [
        "0. 0000 000 0 00 0 00 0 0 00 00 0 0 0 000000 0 end",
        "1. dfaf end",
        "2. 3030 30030 303003 03030 30303 03003 030 003 00303030 end"
    ]
    @State private var index = 0
    @State private var text: String
    
    init() {
        self.text = textList[0]
    }
    
    
    var body: some View {
        VStack {
            MarqueeText($text, fontSize: 20)
                .frame(width: 300, height: 200)
                .background(Color.brown)
                .clipped()

            MarqueeText3($text, fontSize: 20)
                .frame(width: 300, height: 200)
                .background(Color.brown)
                .clipped()
            
            Button {
                // Update text
                index = index + 1 == textList.count
                    ? 0 : index + 1
                text = textList[index]
            } label: {
                Text("Change Text")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct TestMarqueePage_Previews: PreviewProvider {
    static var previews: some View {
        TestMarqueePage()
    }
}
