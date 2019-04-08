//
//  CGRectExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension CGRect {
    init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(x: x, y: y, width: w, height: h)
    }

    /// = frame = to
    mutating func set(to val: CGRect) {
        self = val
    }

    /// View x position
    var x: CGFloat {
        get {
            return minX
        }
        set {
            self = CGRect(x: newValue, y: minY, width: width, height: height)
        }
    }

    /// View y position
    var y: CGFloat {
        get {
            return minY
        }
        set {
            self = CGRect(x: minX, y: newValue, width: width, height: height)
        }
    }

    /// View width
    var w: CGFloat {
        get {
            return width
        }
        set {
            self = CGRect(x: minX, y: minY, width: newValue, height: height)
        }
    }

    /// View height
    var h: CGFloat {
        get {
            return height
        }
        set {
            self = CGRect(x: minX, y: minY, width: width, height: newValue)
        }
    }

    /// horizional center of view
    var miX: CGFloat {
        return minX + width * 0.5
    }

    /// vertical center of view
    var miY: CGFloat {
        return minY + height * 0.5
    }

    /// x + width
    var mxX: CGFloat {
        return maxX
    }

    /// y + height
    var mxY: CGFloat {
        return maxY
    }

    /// Set width and height only
    var size: CGSize {
        get {
            return CGSize(width: width, height: height)
        }
        set {
            self = CGRect(x: minX, y: minY, width: newValue.width, height: newValue.height)
        }
    }
}
