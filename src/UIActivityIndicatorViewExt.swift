//
//  UIActivityIndicatorViewExt.swift
//  LessUI
//
//  Created by Seru on 09/04/2019.
//

import Foundation
import UIKit

public extension UIActivityIndicatorView {
    /// = startAnimating
    @discardableResult
    func anim() -> Self {
        startAnimating()
        return self
    }

    /// = stopAnimating
    @discardableResult
    func stop() -> Self {
        stopAnimating()
        return self
    }

    /// = hidesWhenStopped
    @discardableResult
    func hideStop(_ val: Bool) -> Self {
        hidesWhenStopped = val
        return self
    }

    /// = isAnimating
    var animating: Bool {
        get {
            return isAnimating
        }
        set {
            if newValue {
                anim()
            } else {
                stop()
            }
        }
    }
}
