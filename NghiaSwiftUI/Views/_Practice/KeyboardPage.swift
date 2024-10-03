//
//  KeyboardPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 8/8/24.
//
// https://www.fivestars.blog/articles/swiftui-keyboard/

import SwiftUI

struct KeyboardPage: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink { ScaleContent() } label: { Text("Scale Content") }
                .buttonStyle(RowButtonStyle())
                
                NavigationLink { EdittextTopOutsideContent() } label: { Text("EditText outside Screen") }
                .buttonStyle(RowButtonStyle())
                
                NavigationLink { EdittextTopScaleContent() } label: { Text("EditText Top, Scale Content") }
                .buttonStyle(RowButtonStyle())
                
                NavigationLink { DontChangeContentWhenKeyboard() } label: { Text("Don't Change Content when keyboard") }
                .buttonStyle(RowButtonStyle())
            }
        }
    }
}

struct ScaleContent: View {
    @State private var redSize: CGSize = .zero
    @State private var yellowSize: CGSize = .zero
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            Color.red
                .overlay(Text(verbatim: "\(redSize)"))
                .readSize {
                    redSize = $0
                }
            
            TextField("Name:", text: $name)
            
            Color.yellow
                .overlay(Text(verbatim: "\(yellowSize)"))
                .readSize {
                    yellowSize = $0
                }
        }
        .padding()
    }
}

struct EdittextTopOutsideContent: View {
    @State private var name: String = ""

      var body: some View {
        VStack {
          TextField("Name:", text: $name)

          Color.red
            .frame(height: 314)

          Color.yellow
            .frame(height: 314)
        }
        .padding()
      }
}

struct EdittextTopScaleContent: View {
    @State private var name: String = ""
    
    var body: some View {
        ScrollView {
            TextField("Name:", text: $name)
            
            Color.red
                .frame(height: 314)
            
            TextField("Name:", text: $name)
            
            Color.yellow
                .frame(height: 314)
            
            TextField("Name:", text: $name)
        }
        .padding()
    }
}

struct DontChangeContentWhenKeyboard: View {
    @State private var name: String = ""
    
    var body: some View {
        ScrollView {  // this is now a ScrollView instead of a VStack.
            TextField("Name:", text: $name)
            
            Color.red
                .frame(height: 314)
            
            TextField("Name:", text: $name)
            
            Color.yellow
                .frame(height: 314)
            
            TextField("Name:", text: $name)
        }
        .padding()
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    KeyboardPage()
}
