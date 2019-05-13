//
//  UIImageExt.swift
//  LessUI
//
//  Created by Seru on 09/04/2019.
//

import Foundation
import UIKit

public extension UIImage {
    /// = init(named: String)
    convenience init?(_ name: String) {
        self.init(named: name)
    }

    /// Get an imageview
    @discardableResult
    func view() -> UIImageView {
        return UIImageView(image: self)
    }
}
