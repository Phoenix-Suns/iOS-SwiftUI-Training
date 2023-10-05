//
//  ColorExt.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 9/19/23.
//

import Foundation
import SwiftUI

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

extension Color {
    static var random: Color {
        return Color(UIColor.random)
    }
}
