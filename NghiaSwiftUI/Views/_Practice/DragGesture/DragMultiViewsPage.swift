//
//  DragMultiViewsPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 12/26/23.
//

import SwiftUI

struct DragMultiViewsPage: View {

    @State private var circles: [CircleDraggable] = [
        CircleDraggable(),
        CircleDraggable(),
        CircleDraggable()
    ]
    
    var body: some View {
        ZStack {
            ForEach(circles) { circle in
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                    .position(circle.position)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let index = self.index(for: circle)
                                self.circles[index].position = value.location
                            }
                            .onEnded { value in
                                // Handle any additional logic after drag ends
                                debugPrint(">>> onEnded", value.location)
                            }
                    )
            }
        }
    }
    
    private func index(for circle: CircleDraggable) -> Int {
        if let index = circles.firstIndex(where: { $0.id == circle.id }) {
            return index
        }
        return 0
    }
}

struct CircleDraggable: Identifiable {
    let id = UUID()
    var position: CGPoint = .zero
}

#Preview {
    DragMultiViewsPage()
}
