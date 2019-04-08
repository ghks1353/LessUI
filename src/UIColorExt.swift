//
//  UIColorExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: a
        )
    }

    /// Single hex value into rgb value
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            r: (rgb >> 16) & 0xFF,
            g: (rgb >> 8) & 0xFF,
            b: rgb & 0xFF,
            a: a
        )
    }

    /// Get rgb hex value from current color
    func rgb() -> Int {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            let iR = Int(r * 255.0)
            let iG = Int(g * 255.0)
            let iB = Int(b * 255.0)
            let iA = Int(a * 255.0)

            let rgb = (iA << 24) + (iR << 16) + (iG << 8) + iB
            return rgb
        } else {
            return 0xFFFFFF
        }
    }
}
