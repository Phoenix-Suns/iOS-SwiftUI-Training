//
//  ScalingHeaderView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 6/14/24.
//

import SwiftUI

struct HeaderScrollView: View {
    let header: () -> (any View)
    let content: () -> (any View)
    let headerExpandHeight: CGFloat = 300
    let headerCollapsedHeight: CGFloat = 150
    
    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { geometry in
                    AnyView(header())
                        .frame(width: geometry.size.width, height: self.headerHeight(geometry: geometry))
                        .offset(x: 0, y: self.headerOffset(geometry: geometry))
                }.frame(height: 300)
                
                AnyView(content())
            }
        }
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

struct DemoHeaderScrollView: View {
    var body: some View {
        HeaderScrollView {
            header1
        } content: {
            ForEach(data, id: \.self) { item in
                ItemView(data: item)
            }
        }

    }
    
    var data: [String] = Array(0...100).map { item in
        String(item)
    }
    
    @ViewBuilder var header1: some View {
        Image(systemName: "photo.artframe")
            .resizable()
            .frame(height: UIScreen.main.bounds.height / 2.3)
    }
}

struct ItemView: View {
    var data: String
    
    var body: some View {
        Text(data)
            .font(.title)
    }
}

#Preview {
    DemoHeaderScrollView()
}
