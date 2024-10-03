//
//  PagerWithAnimationPage.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 9/19/24.
//

import SwiftUI

struct PagerWithAnimationPage: View {
    @State private var items = ["Item 1", "Item 2", "Item 3", "Item 4"]
    @State private var selectedIndex = 0
    @State private var isNext = true // Track whether we're moving to the next or previous
    
    var body: some View {
        VStack {
            ZStack {
                // Display the selected item with custom transitions
                if selectedIndex < items.count {
                    Text(self.items[self.selectedIndex])
                        .font(.title)
                        .padding()
                        .id(selectedIndex) // Ensure a unique ID for each transition
                        .transition(isNext ? .moveFromRight : .moveFromLeft) // Apply custom transitions
                        .background(Color.gray)
                }
            }
            .frame(height: 100) // Ensure fixed height for a smoother transition
            
            buttons
        }
    }
    
    @ViewBuilder var buttons: some View {
        // Navigation buttons to change the selected index
        HStack {
            Button("Previous") {
                if selectedIndex > 0 {
                    isNext = false // Moving to previous, apply left-to-right transition
                    withAnimation {
                        selectedIndex -= 1
                    }
                }
            }
            
            Button("Next") {
                if selectedIndex < items.count - 1 {
                    isNext = true // Moving to next, apply right-to-left transition
                    withAnimation {
                        selectedIndex += 1
                    }
                }
            }
        }
        .padding()
    }
}

// Custom transitions
extension AnyTransition {
    static var moveFromRight: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing), // Move from right to left
            removal: .move(edge: .leading)
        )
    }
    
    static var moveFromLeft: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .leading), // Move from left to right
            removal: .move(edge: .trailing)
        )
    }
    
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .bottom).combined(with: .opacity),
            removal: .opacity
        )
    }
}

#Preview {
    PagerWithAnimationPage()
}
