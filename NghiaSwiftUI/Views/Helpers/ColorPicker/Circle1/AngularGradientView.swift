//
//  AngularGradientView.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 3/20/24.
//

import SwiftUI

struct AngularGradientView: View {
    /// Struct's private properties.
    private var gradient: Gradient = {
        let colors = (0 ... 360).reversed().map {
            Color(hue: Double($0) / 360, saturation: 1, brightness: 1)
        }
        return Gradient(colors: colors)
    }()
    
    var body: some View {
        AngularGradient(gradient: gradient, center: UnitPoint(x: 0.5, y: 0.5))
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

#Preview {
    AngularGradientView()
}
