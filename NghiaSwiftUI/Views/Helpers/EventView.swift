//
//  EventView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 10/18/23.
//

import SwiftUI

struct EventView: View {

    @State private var offset: CGSize = .zero
    @State private var currentCard = 0
    @State private var didJustSwipe = false

    var randomView: some View {
        return Rectangle()
            .foregroundColor(.green)
            .cornerRadius(20)
            .frame(width: 300, height: 400)
            .shadow(radius: 10)
            .padding()
            .opacity(0.3)
    }

    func offset(for i: Int) -> CGSize {
        return i == currentCard ? offset : .zero
    }

    var body: some View {
        GeometryReader { geo in
            ZStack{
                //            ForEach(currentCard..<5, id: \.self) { i in
                //                self.randomView
                //                    .offset(self.offset(for: i))
                //                    .gesture(self.gesture)
                //            }
                
                LazyHStack(spacing: 0) {
                    // render content
                    ForEach(0 ..< 10, id: \.self) { elem in
                        Text("Index: \(elem)")
                            .offset(self.offset(for: elem))
                            .gesture(self.gesture)
                            .frame(width: geo.size.width, height: geo.size.height)
                            .border(Color.red)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    var gesture: some Gesture {
        DragGesture()
            .onChanged {
                if self.didJustSwipe {
                    self.didJustSwipe = false
                    self.currentCard += 1
                    self.offset = .zero
                } else {
                    self.offset = $0.translation
                }
        }
            .onEnded {
                let w = $0.translation.width
                if abs(w) > 100 {
                    self.didJustSwipe = true
                    let x = w > 0 ? 1000 : -1000
                    withAnimation {
                        self.offset = .init(width: x, height: 0)
                    }
                } else {
                    withAnimation {
                        self.offset = .zero
                    }
                }
                debugPrint(">>>", self.offset)
        }
    }
}

#Preview {
    EventView()
}
