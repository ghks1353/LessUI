//
//  UIViewExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension UIView {
    /// Add this view to parent view
    @discardableResult
    func add(to view: UIView) -> Self {
        view.addSubview(self)
        return self
    }

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

    /// Subtract coord from view's min pos
    @discardableResult
    func before(_ from: UIView, x: CGFloat? = nil, y: CGFloat? = nil) -> Self {
        frame = CGRect(x: x == nil ? frame.minX : from.frame.minX - (x ?? 0),
                       y: y == nil ? frame.minY : from.frame.minY - (y ?? 0),
                       width: frame.width, height: frame.height)
        return self
    }

    /// Append coord from view's max pos
    @discardableResult
    func after(_ from: UIView, x: CGFloat? = nil, y: CGFloat? = nil) -> Self {
        frame = CGRect(x: x == nil ? frame.minX : from.frame.maxX + (x ?? 0),
                       y: y == nil ? frame.minY : from.frame.maxY + (y ?? 0),
                       width: frame.width, height: frame.height)
        return self
    }

    /// Add frame variables from current value
    @discardableResult
    func add(x: CGFloat = 0, y: CGFloat = 0, w: CGFloat = 0, h: CGFloat = 0) -> Self {
        frame = CGRect(x: frame.minX + x, y: frame.minY + y,
                       width: frame.width + w, height: frame.height + h)
        return self
    }

    /// Set frame variables
    @discardableResult
    func set(x: CGFloat? = nil, y: CGFloat? = nil, w: CGFloat? = nil, h: CGFloat? = nil) -> Self {
        frame = CGRect(x: x ?? frame.minX, y: y ?? frame.minY,
                       width: w ?? frame.width, height: h ?? frame.height)
        return self
    }

    /// Align ALL views to horizional center of subviews max sized view
    @discardableResult
    func subCenter() -> Self {
        var maxWidth: CGFloat = 0
        for v in subviews {
            if v.mxX > maxWidth { maxWidth = v.mxX }
        }

        // Align
        for v in subviews {
            v.hCenter(val: maxWidth)
        }

        return self
    }

    /// = vCenter() -> hCenter()
    @discardableResult
    func vhCenter() -> Self {
        return vCenter().hCenter()
    }

    /// Align view to horizional center of parent
    @discardableResult
    func hCenter() -> Self {
        return hCenter(to: superview)
    }

    /// Align view to horizional center of superview
    @discardableResult
    func hCenter(to view: UIView?) -> Self {
        return hCenter(val: view?.frame.width ?? 0)
    }

    /// Align view to horizional center by value
    @discardableResult
    func hCenter(val: CGFloat) -> Self {
        frame = CGRect(x: val * 0.5 - frame.width * 0.5,
                       y: frame.minY,
                       width: frame.width,
                       height: frame.height)

        return self
    }

    /// Align view to vertical center of parent
    @discardableResult
    func vCenter() -> Self {
        return vCenter(to: superview)
    }

    /// Align view to vertical center of superview
    @discardableResult
    func vCenter(to view: UIView?) -> Self {
        return vCenter(val: view?.frame.height ?? 0)
    }

    /// Align view to vertical center of superview
    @discardableResult
    func vCenter(val: CGFloat) -> Self {
        frame = CGRect(x: frame.minX,
                       y: val * 0.5 - frame.height * 0.5,
                       width: frame.width,
                       height: frame.height)

        return self
    }

    /// Resizes by subviews width and height
    @discardableResult
    func fit() -> Self {
        var maxWidth: CGFloat = 0
        var maxHeight: CGFloat = 0

        for v in subviews {
            if v.mxX > maxWidth { maxWidth = v.mxX }
            if v.mxY > maxHeight { maxHeight = v.mxY }
        }

        size = CGSize(width: maxWidth, height: maxHeight)
        return self
    }

    /// = set width 0 and sizeToFit()
    @discardableResult
    func prefix() -> Self {
        return prefix(0)
    }

    /// fit width to argument, before sizeoffit
    @discardableResult
    func prefix(_ val: CGFloat = 0) -> Self {
        frame = CGRect(x: frame.minX, y: frame.minY, width: val, height: 0)
        sizeToFit()

        return self
    }
}
