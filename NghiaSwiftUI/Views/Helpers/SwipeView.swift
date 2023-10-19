//  File name   : SwipeView.swift
//
//  Author      : Nghia Tran
//  Created date: 9/19/23
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2023 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import Foundation
import SwiftUI

struct SwipeView<Content: View>: View {
    var body: some View {
        GeometryReader { geometry in
            let view = content(geometry.size.width, geometry.size.height)
            let x = -CGFloat(index) * geometry.size.width

            view
                .offset(x: self.updatePosition ? x : 0 )    // Move parent view to next child view
                .offset(x: self.updatePosition ? translation : 0) // swipe with user touch
                .gesture(
                    DragGesture().updating($translation) { value, state, _ in
                        state = value.translation.width
                    }.onEnded { value in
                        let offset = value.translation.width / geometry.size.width * changeRatio
                        let newIndex = (CGFloat(index) - offset).rounded()

                        withAnimation(.easeInOut) {
                            index = min(max(Int(newIndex), 0), total - 1)
                            indexChange(index)
                            debugPrint(">>>", index)
                        }
                    }
                )
        }
    }

    /// Struct's public properties.
    private var total: Int
    @Binding private var index: Int
    private var updatePosition: Bool
    private var content: (_ width: CGFloat, _ height: CGFloat) -> Content
    private var indexChange: (Int) -> Void

    /// Struct's constructors.
    init(total: Int, index: Binding<Int>, updatePosition: Bool = true, @ViewBuilder content: @escaping (_ width: CGFloat, _ height: CGFloat) -> Content, indexChange: @escaping (Int) -> Void) {
        self.total = total
        self._index = index
        self.updatePosition = updatePosition
        self.content = content
        self.indexChange = indexChange
    }

    /// Struct's private properties.
    @GestureState private var translation: CGFloat = 0
    private let changeRatio: CGFloat = 2
}

// MARK: - SwipeView's preview
#if DEBUG
    struct SwipeView_Previews: PreviewProvider {
        @State static var index: Int = 0

        static var previews: some View {
            SwipeView(total: 10, index: $index, updatePosition: true, content: { width, height in
                LazyHStack(spacing: 0) {
                    // render content
                    ForEach(0 ..< 10, id: \.self) { elem in
                        Text("Index: \(elem)")
                            .frame(width: width, height: height)
                            .border(Color.red)
                    }
                }
                .background(Color.blue)
            }, indexChange: { i in
                withAnimation(.easeInOut) {
                    index = i
                }
            })
        }
    }
#endif
