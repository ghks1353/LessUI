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
               
               background bg: UIColor = .clear,
               radius rad: CGFloat = 0,
               
               title lbl: String = "",
               titleInset lns: UIEdgeInsets = .zero,
               
               font fnt: String? = nil,
               size pt: CGFloat? = nil,
               bold st: Bool? = nil,
               
               image img: UIImage? = nil,
               disabledImage dimg: UIImage? = nil,
               imageInset ins: UIEdgeInsets = .zero,
               
               semantic sem: UISemanticContentAttribute = .unspecified) -> Self {
        if col != nil {
            setTitleColor(col!, for: .normal)
        }
        if tou != nil {
            setTitleColor(tou!, for: .highlighted)
        }
        if dis != nil {
            setTitleColor(dis!, for: .disabled)
        }

        backgroundColor = bg

        clipsToBounds = true
        layer.cornerRadius = rad

        setTitle(lbl, for: .normal)
        setImage(img, for: .normal)
        setImage(dimg, for: .disabled)
        
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

        titleEdgeInsets = lns
        imageEdgeInsets = ins

        semanticContentAttribute = sem
        return self
    }
}
