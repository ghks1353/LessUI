//
//  UIViewArrayExt.swift
//  LessUI
//
//  Created by Seru on 10/04/2019.
//

import Foundation
import UIKit

public extension Array where Element:UIView {
    /// Set whole views size
    @discardableResult
    func set(w: CGFloat? = nil, h: CGFloat? = nil) -> [UIView] {
        forEach { view in
            view.frame = CGRect(x: view.frame.minX,
                                y: view.frame.minY,
                                width: w == nil ? view.frame.width : (w ?? 0),
                                height: h == nil ? view.frame.height : (h ?? 0))
        }
        return self as [UIView]
    }
    
    /// Listing view from start to end with value
    @discardableResult
    func list(x: CGFloat? = nil, y: CGFloat? = nil) -> [UIView] {
        for i: Int in 0 ..< count {
            let coord: CGPoint = CGPoint(x: x == nil ? self[i].frame.minX : (x ?? 0) * CGFloat(i),
                                         y: y == nil ? self[i].frame.minY : (y ?? 0) * CGFloat(i))
            self[i].frame = CGRect(x: coord.x, y: coord.y, width: self[i].frame.width, height: self[i].frame.height)
        }
        return self as [UIView]
    }

    /// Maximum view width of array
    var mxX: CGFloat {
        return self.max { x, y in
            x.frame.maxX < y.frame.maxX
        }?.frame.maxX ?? 0
    }

    /// Maximum view height of array
    var mxY: CGFloat {
        return self.max { x, y in
            x.frame.maxY < y.frame.maxY
        }?.frame.maxY ?? 0
    }
}
