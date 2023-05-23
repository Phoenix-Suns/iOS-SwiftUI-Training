//
//  NghiaSwiftUIApp.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 15/05/2023.
//

import SwiftUI

@main
struct NghiaSwiftUIApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
    }
}
