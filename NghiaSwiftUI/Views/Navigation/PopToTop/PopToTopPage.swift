//
//  PopToTopPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 12/12/23.
//

import SwiftUI

struct NavigationUtil {
    static func popToRootView(animated: Bool = false) {
        findNavigationController(viewController: UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }?.rootViewController)?.popToRootViewController(animated: animated)
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UITabBarController {
            return findNavigationController(viewController: navigationController.selectedViewController)
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
}

struct PopToTopPage: View {
    var body: some View {
        NavigationLink {
            ContentView2()
        } label: {
            Text("Page 1 (root)")
        }
    }
}

struct ContentView2: View {
    var body: some View {
        NavigationLink {
            ContentView3()
        } label: {
            Text("Page 2")
        }
        .navigationBarTitle("Two")
    }
}

struct ContentView3: View {
    var body: some View {
        VStack {
            Text("Page 3")
            Button (action: {
                NavigationUtil.popToRootView()
            }){
                Text("Pop to root")
            }
        }.navigationBarTitle("Three")
    }
}

#Preview {
    PopToTopPage()
}
