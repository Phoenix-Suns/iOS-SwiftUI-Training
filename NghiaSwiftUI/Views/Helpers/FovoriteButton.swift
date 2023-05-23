//
//  FovoriteButton.swift
//  NghiaSwiftUI
//
//  Created by Nghia PC on 21/05/2023.
//

import SwiftUI

struct FovoriteButton: View {
    // isSet will change by View Action
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FovoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FovoriteButton(isSet: .constant(true))
    }
}
