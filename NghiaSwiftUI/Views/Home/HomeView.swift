//
//  HomeView.swift
//  NghiaSwiftUI
//
//  Created by Nghia on 5/23/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                // Navigation Button
                NavigationLink {
                    Tab() // Text("Custom")
                } label: {
                    Label("Tab", systemImage: "table.furniture.fill")
                }
                .buttonStyle(RowButtonStyle())
                NavigationLink {
                    ListVertical()
                } label: {
                    Label("List Vertical", systemImage: "list.bullet.rectangle.portrait.fill")
                }
                .buttonStyle(RowButtonStyle())
                NavigationLink {
                    ListHorizontal()
                } label: {
                    Label("List Horizontal", systemImage: "distribute.horizontal.right.fill")
                }
                .buttonStyle(RowButtonStyle())
            }
            // Navigation Title
            .navigationTitle("SwiftUI Training")
            // Navigation Style
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct RowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.black)
            .background(.white)
            .font(.body)
        // Scale when click
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(Animation.easeOut(duration: 0.2), value: UUID())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
