//
//  TestImageScalePage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 10/19/23.
//

import SwiftUI

struct TestImageScalePage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                let image = Image("bg_square")
                
                HStack {
                    Text("Fit width")
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .border(Color.black, width: 5)
                        .clipped()
                }
                
                HStack {
                    Text("Fit")
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 150)
                        .border(Color.black, width: 5)
                        .clipped()
                }
                
                HStack {
                    Text("Scale")
                    Spacer()
                    image
                        .resizable()
                        .frame(width: 200, height: 150)
                        .border(Color.black, width: 5)
                        .clipped()
                }
                
                HStack {
                    Text("Crop Top")
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 150, alignment: .top)
                        .border(Color.black, width: 5)
                        .clipped()
                }
                
                HStack {
                    Text("Crop Center")
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 150, alignment: .center)
                        .border(Color.black, width: 5)
                        .clipped()
                }
                
                
                HStack {
                    Text("Crop Bottom")
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 150, alignment: .bottom)
                        .border(Color.black, width: 5)
                        .clipped()
                }
                
                HStack {
                    Text("Crop leading")
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 200, alignment: .leading)
                        .border(Color.black, width: 5)
                        .clipped()
                }
                
                HStack {
                    Text("Crop trailing")
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 200, alignment: .trailing)
                        .border(Color.black, width: 5)
                        .clipped()
                }
            }
        }
    }
}

#Preview {
    TestImageScalePage()
}
