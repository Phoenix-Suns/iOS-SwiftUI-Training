//  File name   : PagerView.swift
//
//  Author      : Nghia Tran
//  Created date: 7/10/23
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2023 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import SwiftUI

struct PagerView<Data, Content>: View
    where Data: RandomAccessCollection, Data.Element: Hashable, Content: View
{
    var body: some View {
        GeometryReader { geometry in
            LazyHStack(spacing: 0) {
                // render content
                ForEach(data, id: \.self) { elem in
                    content(elem)
                        .frame(width: geometry.size.width)
                }
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(currentIndex) * geometry.size.width)
            .offset(x: translation)
            .gesture(
                DragGesture().updating($translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width * 1.25 // 1.25 * width will change page
                    let newIndex = (CGFloat(currentIndex) - offset).rounded()
                    
                    withAnimation(Animation.interactiveSpring(
                        response: 2
                    )) {
                        currentIndex = min(max(Int(newIndex), 0), data.count - 1)
                    }
                }
            )
        }
    }

    /// Struct's public properties.
    private let data: Data
    private let content: (Data.Element) -> Content

    /// Struct's constructor.
    init(_ data: Data,
         currentIndex: Binding<Int>,
         @ViewBuilder content: @escaping (Data.Element) -> Content)
    {
        self.data = data
        self.content = content
        self._currentIndex = currentIndex
    }

    /// Struct's private properties.
    @GestureState private var translation: CGFloat = 0
    @Binding var currentIndex: Int
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ["one", "two", "three"]
        PagerView(data, currentIndex: .constant(0)) { item in
            VStack {
                Text(item)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.gray)
        }
    }
}
