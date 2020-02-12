//
//  UIButtonExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension UIButton {
    /// Set button title inset
    @discardableResult
    func inset(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> Self {
        titleEdgeInsets = UIEdgeInsets(top: top ?? titleEdgeInsets.top,
                                       left: left ?? titleEdgeInsets.left,
                                       bottom: bottom ?? titleEdgeInsets.bottom,
                                       right: right ?? titleEdgeInsets.right)

        return self
    }

    /// Apply button styles by params
    @discardableResult
    func style(color col: UIColor? = nil,
               touch tou: UIColor? = nil,
               disabled dis: UIColor? = nil,
               
               background bg: UIColor? = nil,
               radius rad: CGFloat? = nil,
               
               title lbl: String? = nil,
               titleInset lns: UIEdgeInsets? = nil,
               
               font fnt: String? = nil,
               size pt: CGFloat? = nil,
               bold st: Bool? = nil,
               
               image img: UIImage? = nil,
               disabledImage dimg: UIImage? = nil,
               imageInset ins: UIEdgeInsets? = nil,
               
               semantic sem: UISemanticContentAttribute? = nil) -> Self {
        if col != nil { setTitleColor(col!, for: .normal) }
        if tou != nil { setTitleColor(tou!, for: .highlighted) }
        if dis != nil { setTitleColor(dis!, for: .disabled) }
        if bg != nil { backgroundColor = bg ?? .clear }

        if rad ?? 0 > 0 { clipsToBounds = true }
        if rad != nil { layer.cornerRadius = rad ?? 0 }

        if lbl != nil { setTitle(lbl, for: .normal) }
        if img != nil { setImage(img, for: .normal) }
        if dimg != nil { setImage(dimg, for: .disabled) }
        
        // Set font
        let fontSize: CGFloat = pt ?? (titleLabel?.font.pointSize ?? UIFont.systemFontSize)
        let fontBold: Bool = st ?? false
        
        if fnt != nil {
            titleLabel?.font = UIFont(name: fnt ?? "", size: fontSize)
        } else { // Seperate system font applies for iOS 13
            if fontBold {
                titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
            } else {
                titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
            }
        }

        if lns != nil { titleEdgeInsets = lns ?? .zero }
        if ins != nil { imageEdgeInsets = ins ?? .zero }
        if sem != nil { semanticContentAttribute = sem ?? .unspecified }

        return self
    }
}
