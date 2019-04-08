//
//  UILabelExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

extension UILabel {
    /// = textAlignment
    var align: NSTextAlignment {
        get {
            return textAlignment
        }
        set {
            textAlignment = newValue
        }
    }

    /// = textColor
    var color: UIColor {
        get {
            return textColor
        }
        set {
            textColor = newValue
        }
    }

    /// system font size
    var pt: CGFloat {
        get {
            return font.pointSize
        }
        set {
            font = UIFont.systemFont(ofSize: newValue)
        }
    }

    /// System bold font size
    var boldPt: CGFloat {
        get {
            return font.pointSize
        }
        set {
            font = UIFont.boldSystemFont(ofSize: newValue)
        }
    }

    /// = numberOfLines
    var lines: Int {
        get {
            return numberOfLines
        }
        set {
            numberOfLines = newValue
        }
    }

    /// Apply font styles by params
    func style(font f: String? = nil,
               size s: CGFloat = 13,
               color c: Int = 0xFFFFFF,
               bold b: Bool = false,
               align a: NSTextAlignment = .left,
               lines l: Int = 0) {
        if f != nil {
            font = UIFont(name: f ?? "", size: s)
        } else {
            if !b {
                font = UIFont.systemFont(ofSize: s)
            } else {
                font = UIFont.boldSystemFont(ofSize: s)
            } // end if
        }

        textAlignment = a
        numberOfLines = l

        textColor = UIColor(rgb: c)
    }
}
