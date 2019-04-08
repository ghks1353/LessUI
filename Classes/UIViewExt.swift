//
//  UIViewExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension UIView {
    /// Add a view into this view
    func add(_ view: UIView) {
        addSubview(view)
    }

    /// Add views into this view
    func add(_ views: UIView...) {
        views.forEach { obj in
            addSubview(obj)
        }
    }

    /// Add views with array into this view
    func add(_ views: [UIView]) {
        views.forEach { obj in
            addSubview(obj)
        }
    }

    /// = removeFromSuperview()
    func remove() {
        removeFromSuperview()
    }

    /// isHidden = false
    func show() {
        isHidden = false
    }

    /// isHidden = true
    func hide() {
        isHidden = true
    }

    /// !isHidden
    var visible: Bool {
        get {
            return !isHidden
        }
        set {
            isHidden = !newValue
        }
    }

    /// View x position
    var x: CGFloat {
        get {
            return frame.x
        }
        set {
            frame.x = newValue
        }
    }

    /// View y position
    var y: CGFloat {
        get {
            return frame.y
        }
        set {
            frame.y = newValue
        }
    }

    /// View width
    var w: CGFloat {
        get {
            return frame.w
        }
        set {
            frame.w = newValue
        }
    }

    /// View height
    var h: CGFloat {
        get {
            return frame.h
        }
        set {
            frame.h = newValue
        }
    }

    /// horizional center of view
    var miX: CGFloat {
        return frame.miX
    }

    /// vertical center of view
    var miY: CGFloat {
        return frame.miY
    }

    /// x + width
    var mxX: CGFloat {
        return frame.mxX
    }

    /// y + height
    var mxY: CGFloat {
        return frame.mxY
    }

    /// Set width and height only
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }

    /// = frame = to
    func set(to val: CGRect) {
        frame = val
    }

    /// Align view to horizional center of parent
    func hCenter() {
        hCenter(super: superview)
    }

    /// Align view to horizional center of superview
    func hCenter(super view: UIView?) {
        frame = CGRect(x: (view?.frame.width ?? 0) * 0.5 - frame.width * 0.5,
                       y: frame.minY, width: frame.width, height: frame.height)
    }

    /// Align view to vertical center of parent
    func vCenter() {
        vCenter(super: superview)
    }

    /// Align view to vertical center of superview
    func vCenter(super view: UIView?) {
        frame = CGRect(x: frame.minX,
                       y: (view?.frame.height ?? 0) * 0.5 - frame.height * 0.5, width: frame.width, height: frame.height)
    }

    /// = sizeToFit()
    func prefix() -> UIView {
        sizeToFit()
        
        return self
    }

    /// fit width to argument, before sizeoffit
    func prefix(with val: CGFloat = 0) -> UIView {
        frame = CGRect(x: frame.minX, y: frame.minY, width: val, height: 0)
        sizeToFit()
        
        return self
    }
}
