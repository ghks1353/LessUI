//
//  NSAttributedStringExt.swift
//  LessUI
//
//  Created by Seru on 22/04/2019.
//

import Foundation
import UIKit

public extension NSAttributedString {
    
    /// Set attributed string with html string
    @discardableResult
    func html(str: String = "", font: UIFont? = nil, color: UIColor? = nil) -> NSAttributedString {
        return NSAttributedString().append(html: str, font: font, color: color)
    }
    
    /// Append attributed string with html string
    @discardableResult
    func append(html str: String = "", font: UIFont? = nil, color: UIColor? = nil) -> NSAttributedString {
        let data: Data = str.data(using: .utf8) ?? Data()
        let attrStr: NSMutableAttributedString = NSMutableAttributedString(attributedString: self)
        
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
        
        return attrStr
    }
    
    /// Align attributedstring
    @discardableResult
    func alignAttr(to align: NSTextAlignment = .center) -> NSAttributedString {
        let attrStr: NSMutableAttributedString = NSMutableAttributedString(attributedString: self)
        let mutableParagraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
        mutableParagraph.alignment = align
        
        attrStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: mutableParagraph, range: NSRange(location: 0, length: attrStr.length))
        
        return attrStr
    }
    
}
