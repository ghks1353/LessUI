//
//  UIViewControllerExt.swift
//  LessUI
//
//  Created by Seru on 08/04/2019.
//

import Foundation
import UIKit

public extension UIViewController {
    /// Add a view into this ViewController's view
    func add(_ view: UIView) {
        self.view.addSubview(view)
    }

    /// Add views into this ViewController's view
    func add(_ views: UIView...) {
        views.forEach { obj in
            view.addSubview(obj)
        }
    }

    /// Add views with array into this viewController's view
    func add(_ views: [UIView]) {
        views.forEach { obj in
            view.addSubview(obj)
        }
    }

    var w: CGFloat {
        return view.frame.width
    }

    var h: CGFloat {
        return view.frame.height
    }

    /// horizional center of ViewController's view
    var miX: CGFloat {
        return view.frame.miX
    }

    /// vertical center of ViewController's view
    var miY: CGFloat {
        return view.frame.miY
    }

    var mxX: CGFloat {
        if #available(iOS 11.0, *) {
            return self.view.frame.width - self.view.safeAreaInsets.right
        } else {
            return view.frame.width
        }
    }

    var mxY: CGFloat {
        return h - tab - bottom
    }

    var status: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }

    var nav: CGFloat {
        return (navigationController?.navigationBar.frame.height ?? 0)
    }

    var top: CGFloat {
        return UIApplication.shared.statusBarFrame.height + (navigationController?.navigationBar.frame.height ?? 0)
    }

    var bottom: CGFloat {
        return safe.bottom
    }

    var tab: CGFloat {
        if hidesBottomBarWhenPushed {
            return 0
        }
        return navigationController?.tabBarController?.tabBar.frame.height ?? 0
    }

    var safe: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaInsets
        } else { // fallback
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}
