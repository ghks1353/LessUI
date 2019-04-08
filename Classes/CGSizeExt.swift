//
//  CGSizeExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension CGSize {
    init(w: CGFloat, h: CGFloat) {
        self.init(width: w, height: h)
    }

    var w: CGFloat {
        return width
    }

    var h: CGFloat {
        return height
    }
}
