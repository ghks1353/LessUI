//
//  UILabelExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension UILabel {
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
    @discardableResult
    func style(font f: String? = nil,
               size s: CGFloat? = nil,
               color c: UIColor? = nil,
               bold b: Bool = false,
               align a: NSTextAlignment? = nil,
               lines l: Int? = nil) -> Self {
                   
        let currentSize: CGFloat = s ?? font.pointSize
        if f != nil {
            font = UIFont(name: f ?? "", size: currentSize)
        } else {
            if !b {
                font = UIFont.systemFont(ofSize: currentSize)
            } else {
                font = UIFont.boldSystemFont(ofSize: currentSize)
            } // end if
        }

        if a != nil { textAlignment = a ?? .left }
        if l != nil { numberOfLines = l ?? 0 }
        if c != nil { textColor = c ?? .white }

        return self
    }
    
    /// Set attributed string with html string
    @discardableResult
    func html(str: String = "", font: UIFont? = nil, color: UIColor? = nil) -> Self {
        attributedText = NSAttributedString().html(str: str, font: font, color: color)
        return self
    }
    
    /// Append attributed string with html string
    @discardableResult
    func append(html str: String = "", font: UIFont? = nil, color: UIColor? = nil) -> Self {
        attributedText = (attributedText ?? NSAttributedString()).append(html: str, font: font, color: color)
        return self
    }
    
    /// Align attributedstring
    @discardableResult
    func alignAttr(to align: NSTextAlignment = .center) -> Self {
        attributedText = (attributedText ?? NSAttributedString()).alignAttr(to: align)
        return self
    }
    
}
