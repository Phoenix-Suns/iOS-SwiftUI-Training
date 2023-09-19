//
//  LoadingView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 6/26/23.
//

import SwiftUI

struct LoadingView<Content: View, LoadingContent: View>: View {
    var body: some View {
        ZStack {
            let color = color ?? .gray
            if isShow {
                content
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: color))
                    loadingContent
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
            } else {
                content
            }
        }
    }
    
    private let isShow: Bool
    private var color: Color? = nil
    private let content: Content
    private let loadingContent: LoadingContent
    
    init(isShow: Bool, color: Color? = nil, content: @escaping () -> Content, loadingContent: @escaping () -> LoadingContent) {
        
        self.isShow = isShow
        self.color = color
        self.content = content()
        self.loadingContent = loadingContent()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isShow: true, content: {
            Text("Content")
        }, loadingContent: {
            Text("Loading")
        })
    }
}
