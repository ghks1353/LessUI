//
//  UIScrollViewExt.swift
//  LessUI
//
//  Created by Seru on 09/04/2019.
//

import Foundation
import UIKit

public extension UIScrollView {
    /// = zoomScale & setZoomScale
    var zoom: CGFloat {
        get {
            return zoomScale
        }
        set {
            setZoomScale(newValue, animated: false)
        }
    }

    /// = isScrollEnabled
    @discardableResult
    func scroll(_ val: Bool) -> Self {
        isScrollEnabled = val
        return self
    }

    /// = isPagingEnabled
    @discardableResult
    func paging(_ val: Bool) -> Self {
        isPagingEnabled = val
        return self
    }

    /// Directional lock
    @discardableResult
    func lock(_ val: Bool) -> Self {
        isDirectionalLockEnabled = val
        return self
    }

    /// Tap to top page
    @discardableResult
    func tapTop(_ val: Bool) -> Self {
        scrollsToTop = val
        return self
    }

    /// ScrollBar style
    @discardableResult
    func bar(_ style: UIScrollView.IndicatorStyle) -> Self {
        indicatorStyle = style
        return self
    }

    /// = showsVerticalScrollIndicator, showsHorizontalScrollIndicator
    @discardableResult
    func indicator(v: Bool? = nil, h: Bool? = nil) -> Self {
        showsVerticalScrollIndicator = v == nil ? showsVerticalScrollIndicator : v ?? false
        showsHorizontalScrollIndicator = h == nil ? showsHorizontalScrollIndicator : h ?? false
        return self
    }

    /// = set alwaysBounceVertical, alwaysBounceHorizontal
    @discardableResult
    func bounce(v: Bool? = nil, h: Bool? = nil) -> Self {
        alwaysBounceVertical = v == nil ? alwaysBounceVertical : v ?? false
        alwaysBounceHorizontal = h == nil ? alwaysBounceHorizontal : h ?? false
        return self
    }

    /// = minimumZoomScale, maximumZoomScale
    @discardableResult
    func zoom(min: CGFloat? = nil, max: CGFloat? = nil) -> Self {
        minimumZoomScale = min == nil ? minimumZoomScale : min ?? 0
        maximumZoomScale = max == nil ? maximumZoomScale : max ?? 0
        return self
    }

    /// setZoomScale with animated
    @discardableResult
    func zoom(to: CGFloat = 1, anim: Bool = false) -> Self {
        setZoomScale(to, animated: anim)
        return self
    }

    /// = contentInset
    @discardableResult
    func inset(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> Self {
        contentInset = UIEdgeInsets(top: top == nil ? contentInset.top : (top ?? 0),
                                    left: left == nil ? contentInset.left : (left ?? 0),
                                    bottom: bottom == nil ? contentInset.bottom : (bottom ?? 0),
                                    right: right == nil ? contentInset.right : (right ?? 0))
        return self
    }

    /// = contentOffset
    @discardableResult
    func offset(x: CGFloat? = nil, y: CGFloat? = nil, anim: Bool = false) -> Self {
        setContentOffset(
            CGPoint(x: x == nil ? contentOffset.x : (x ?? 0),
                    y: y == nil ? contentOffset.y : (y ?? 0)),
            animated: anim
        )
        return self
    }

    /// = contentSize
    @discardableResult
    func content(w: CGFloat? = nil, h: CGFloat? = nil) -> Self {
        contentSize = CGSize(width: w == nil ? contentSize.width : w ?? 0,
                             height: h == nil ? contentSize.height : h ?? 0)
        return self
    }
}
