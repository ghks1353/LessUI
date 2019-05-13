//
//  UIControlExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension UIControl {
    /// = addTarget
    @discardableResult
    func regist(to: Any?, act: Selector, for evt: UIControl.Event) -> Self {
        addTarget(to, action: act, for: evt)
        return self
    }

    /// = removeTarget
    @discardableResult
    func unregist(to: Any?, act: Selector, for evt: UIControl.Event) -> Self {
        removeTarget(to, action: act, for: evt)
        return self
    }
}
