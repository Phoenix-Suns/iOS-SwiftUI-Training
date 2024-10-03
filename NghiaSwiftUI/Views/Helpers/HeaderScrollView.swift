//
//  ScalingHeaderView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 6/14/24.
//

import SwiftUI
import UIKit
import Foundation

// https://medium.com/swlh/swiftui-create-a-stretchable-header-with-parallax-scrolling-4a98faeeb262
// https://gist.github.com/bbaars/d6a5227f4ea585d9176812c882c74c7f
// https://danielsaidi.com/blog/2023/02/06/adding-a-stretchable-header-to-a-swiftui-scroll-view
struct HeaderScrollView: View {
    @Binding var toTop: Bool
    let headerExpandHeight: CGFloat = 300
    let headerCollapsedHeight: CGFloat = 150
    let header: () -> (any View)
    let content: () -> (any View)
    
    var body: some View {
        ScrollViewReader { reader in
            ScrollView {
                VStack {
                    ScrollToTopItem(reader: reader, scrollOnChange: $toTop)
                    
                    GeometryReader { geometry in
                        AnyView(header())
                            .frame(width: geometry.size.width, height: self.headerHeight(geometry: geometry))
                            .offset(x: 0, y: self.headerOffset(geometry: geometry))
                    }.frame(height: 300)
                    
                    AnyView(content())
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func scrollOffset(geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    private func headerOffset(geometry: GeometryProxy) -> CGFloat {
        let offset = scrollOffset(geometry: geometry)
        let sizeOffScreen = headerExpandHeight - headerCollapsedHeight
        
        if offset < -sizeOffScreen {
            let imageOffset = abs(min(-sizeOffScreen, offset))
            return imageOffset - sizeOffScreen
        }
        
        if offset > 0 {
            return -offset
        }
        
        return 0
    }
    
    private func headerHeight(geometry: GeometryProxy) -> CGFloat {
        let offset = scrollOffset(geometry: geometry)
        let imageHeight = geometry.size.height
        
        if offset > 0 {
            return imageHeight + offset
        }
        
        return imageHeight
    }
}

struct ScrollToTopItem: View {
    let reader: ScrollViewProxy
    @Binding var scrollOnChange: Bool
    private let id = "ScrollToTopItem"
    
    var body: some View {
        EmptyView()
            .id(self.id)
            .onChange(of: scrollOnChange) { toTop in
                if toTop {
                    scrollOnChange = false
                    withAnimation {
                        reader.scrollTo(id, anchor: .bottom)
                    }
                }
            }
    }
}

#Preview {
    TestHeaderScrollView()
}
