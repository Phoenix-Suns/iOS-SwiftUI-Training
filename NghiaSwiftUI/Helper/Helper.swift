//  File name   : Helper.swift
//
//  Author      : Nghia Tran
//  Created date: 08/23/22
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2022 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import Foundation
import SwiftUI

private var previousActionTime: Int = 0 // millisecond

enum Helper {
    public static func singleAction(_ action: () -> Void, delayActionTime: Float = 0.3) {
        let currentTime = Int(Date().timeIntervalSince1970 * 1000) // millisecond
        let delayActionTime_ = Int(delayActionTime * 1000)
        if currentTime - previousActionTime > delayActionTime_ {
            previousActionTime = currentTime
            action()
        }
    }

    public static func openSonos() {
        let url = URL(string: "sonos://")

        if let url_ = url {
            UIApplication.shared.open(url_, options: [:], completionHandler: nil)

            if let itunesUrl = URL(string: "https://apps.apple.com/us/app/sonos/id1488977981?ls=1"), UIApplication.shared.canOpenURL(itunesUrl) {
                UIApplication.shared.open(itunesUrl, options: [:], completionHandler: nil)
            }
        }
    }
}
