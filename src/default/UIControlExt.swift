//
//  UIControlExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension UIControl {

    /// Same as addTarget
    @discardableResult
    func register(to: Any?, act: Selector, for evt: UIControl.Event) -> Self {
        addTarget(to, action: act, for: evt)
        return self
    }

    /// Same as removeTarget
    @discardableResult
    func unregister(to: Any?, act: Selector, for evt: UIControl.Event) -> Self {
        removeTarget(to, action: act, for: evt)
        return self
    }

    /// Same as contentHorizontalAlignment
    @discardableResult
    func hAlign(to val: UIControl.ContentHorizontalAlignment) -> Self {
        contentHorizontalAlignment = val
        return self
    }

    /// Same as contentVerticalAlignment
    @discardableResult
    func vAlign(to val: UIControl.ContentVerticalAlignment) -> Self {
        contentVerticalAlignment = val
        return self
    }

}
