//
//  CommonExt.swift
//  NghiaSwiftUI
//
//  Created by Nghia Tran on 10/2/23.
//

import Foundation
import SwiftUI

extension UIViewController {
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

/// Binding<Int16> to Binding<Double>
public extension Binding where Value == Int16 {
    func toDouble() -> Binding<Double> {
        return Binding<Double>(get: { Double(self.wrappedValue) },
                               set: { self.wrappedValue = Int16($0) })
    }
}

