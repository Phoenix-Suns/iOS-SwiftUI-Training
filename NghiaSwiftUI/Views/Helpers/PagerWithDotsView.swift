//  File name   : PagerWithDotsView.swift
//
//  Author      : Nghia Tran
//  Created date: 7/10/23
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2023 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import SwiftUI

struct PagerWithDotsView<Data, Content>: View
    where Data: RandomAccessCollection, Data.Element: Hashable, Content: View
{
    var body: some View {
        ZStack {
            PagerView(data, currentIndex: $currentIndex, content: content)
            VStack {
                Spacer()
                HStack(spacing: 6) {
                    ForEach(0 ..< data.count, id: \.self) { index in
                        Circle()
                            .foregroundColor((index == currentIndex) ? .black : .white)
                            .frame(width: 10, height: 10)
                    }
                }
            }.padding()
        }
    }

    /// Struct's public properties.
    private let data: Data
    private let content: (Data.Element) -> Content

    /// Struct's constructor.
    init(_ data: Data,
         @ViewBuilder content: @escaping (Data.Element) -> Content)
    {
        self.data = data
        self.content = content
    }

    /// Struct's private properties.
    @GestureState private var translation: CGFloat = 0
    @State var currentIndex: Int = 0
}

struct PagerWithDotsView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ["one", "two", "three"]
        PagerWithDotsView(data) { item in
            VStack {
                Text(item)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.gray)
        }
    }
}
