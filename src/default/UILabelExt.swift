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
               size s: CGFloat = 13,
               color c: UIColor = .white,
               bold b: Bool = false,
               align a: NSTextAlignment = .left,
               lines l: Int = 0) -> Self {
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

        textColor = c

        return self
    }
    
    /// Set attributed string with html string
    @discardableResult
    func html(str: String = "", font: UIFont? = nil, color: UIColor? = nil) -> Self {
        attributedText = NSAttributedString()
        
        return append(html: str, font: font, color: color)
    }
    
    /// Append attributed string with html string
    @discardableResult
    func append(html str: String = "", font: UIFont? = nil, color: UIColor? = nil) -> Self {
        let data: Data = str.data(using: .utf8) ?? Data()
        let attrStr: NSMutableAttributedString = NSMutableAttributedString(attributedString: attributedText ?? NSAttributedString())
        
        do {
            let newStr: NSMutableAttributedString = try NSMutableAttributedString(data: data,
                                                                                  options: [.documentType: NSAttributedString.DocumentType.html,
                                                                                            .characterEncoding: String.Encoding.utf8.rawValue],
                                                                                  documentAttributes: nil)
            
            newStr.addAttribute(NSAttributedString.Key.font,
                                 value: font ?? UIFont.systemFont(ofSize: 13),
                                 range: NSRange(location: 0, length: newStr.length))
            newStr.addAttribute(NSAttributedString.Key.foregroundColor,
                                 value: color ?? UIColor.black,
                                 range: NSRange(location: 0, length: newStr.length))
            attrStr.append(newStr)
        } catch {
            // ...
        }
        
        // Set attributed str
        attributedText = attrStr
        
        return self
    }
    
    /// Align attributedstring
    @discardableResult
    func alignAttr(to align: NSTextAlignment = .center) -> Self {
        let attrStr: NSMutableAttributedString = NSMutableAttributedString(attributedString: attributedText ?? NSAttributedString())
        let mutableParagraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
        mutableParagraph.alignment = align
        
        attrStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: mutableParagraph, range: NSRange(location: 0, length: attrStr.length))
        attributedText = attrStr
        return self
    }
    
}
