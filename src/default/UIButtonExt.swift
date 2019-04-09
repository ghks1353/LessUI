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
    func style(color col: UIColor = .black,
               touch tou: UIColor = .black,
               disabled dis: UIColor = .gray,
               
               background bg: UIColor = .clear,
               radius rad: CGFloat = 0,
               
               title lbl: String = "",
               titleInset lns: UIEdgeInsets = .zero,
               
               image img: UIImage? = nil,
               disabledImage dimg: UIImage? = nil,
               imageInset ins: UIEdgeInsets = .zero,
               
               semantic sem: UISemanticContentAttribute = .unspecified) -> Self {
        setTitleColor(col, for: .normal)
        setTitleColor(tou, for: .highlighted)
        setTitleColor(dis, for: .disabled)

        backgroundColor = bg

        clipsToBounds = true
        layer.cornerRadius = rad

        setTitle(lbl, for: .normal)
        setImage(img, for: .normal)
        setImage(dimg, for: .disabled)

        titleEdgeInsets = lns
        imageEdgeInsets = ins

        semanticContentAttribute = sem
        return self
    }
}
