//
//  HomeView.swift
//  NghiaSwiftUI
//
//  Created by Nghia on 5/23/23.
//

import SwiftUI

struct NavigationPage: View {
    var body: some View {
        NavigationView {
            List {
                // Navigation Button
                NavigationLink {
                    Text("Custom")
                } label: {
                    Text("Go Text")
                }
                
                // Custom Navigation View
                NavigationLink(
                    destination: Text("Custom Nav View"),
                    label: {
                        HStack {
                            Image(systemName: "scribble")
                            VStack {
                                Text("Title")
                                    .foregroundColor(.pink)
                                Text("Subtitle")
                            }
                        }
                    })
                
                // Go to Other View
                NavigationLink {
                    TabPage()
                } label: {
                    Label("Goto Other View", systemImage: "table.furniture.fill")
                }
                
                // Send View Data
                SendMessageView().padding()
                
                // Hide icon ">" on list
                HStack {
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                }
                .overlay{
                    NavigationLink(destination: {
                        Text("Go to...")
                    },label: {
                        EmptyView()
                    })
                    .opacity(0.0)
                }
            }
            // Navigation Title
            .navigationTitle("SwiftUI Training")
            // Navigation Style
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationViewStyle(.stack)
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPage()
    }
}
