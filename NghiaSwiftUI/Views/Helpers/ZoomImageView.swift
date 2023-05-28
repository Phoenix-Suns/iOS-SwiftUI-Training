//
//  ZoomImageView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 5/25/23.
//

import SwiftUI

struct ZoomImageView: View {
    @State private var zoomed = false
    
    var body: some View {
        ZStack {
            Image("chincoteague")
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    
                    // Auto animation
                    withAnimation {
                        zoomed.toggle()
                    }
            }
            
            if zoomed {
                Image(systemName: "video.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .padding()
                    .transition(.move(edge: .trailing)) // Animation
            }
        }
    }
}

struct ZoomImageView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomImageView()
    }
}
