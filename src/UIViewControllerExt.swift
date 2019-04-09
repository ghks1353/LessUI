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
    @discardableResult
    func add(_ view: UIView) -> Self {
        self.view.addSubview(view)
        return self
    }

    /// Add views into this ViewController's view
    @discardableResult
    func add(_ views: UIView...) -> Self {
        views.forEach { obj in
            view.addSubview(obj)
        }
        return self
    }

    /// Add views with array into this viewController's view
    @discardableResult
    func add(_ views: [UIView]) -> Self {
        views.forEach { obj in
            view.addSubview(obj)
        }
        return self
    }

    /// Show default signle dialog with no/yes button
    @discardableResult
    func dialog(title: String? = nil,
                message: String? = nil,
                
                negative: String? = nil,
                positive: String? = nil,
                
                negativeStyle: UIAlertAction.Style = .cancel,
                positiveStyle: UIAlertAction.Style = .default,
                
                onNegative: ((UIAlertAction) -> Void)? = nil,
                onPositive: ((UIAlertAction) -> Void)? = nil,
                
                on: (() -> Void)? = nil) -> UIAlertController {
        let dialogView: UIAlertController = UIAlertController(title: title,
                                                              message: message,
                                                              preferredStyle: .alert)
        if positive != nil {
            dialogView.addAction(UIAlertAction(title: positive, style: positiveStyle, handler: onPositive))
        }
        if negative != nil {
            dialogView.addAction(UIAlertAction(title: negative, style: negativeStyle, handler: onNegative))
        }

        // Show view
        present(dialogView, animated: true, completion: on)

        return dialogView
    }

    /// Show default alert dialog with actionsheet style from string array
    @discardableResult
    func actions(title: String? = nil,
                 message: String? = nil,
                 
                 actions: [String] = [],
                 styles: [String: UIAlertAction.Style] = [:],
                 
                 on: (() -> Void)? = nil,
                 onSelect: @escaping ((UIAlertController, UIAlertAction, Int) -> Void)) -> UIAlertController {
        let sheetView: UIAlertController = UIAlertController(title: title,
                                                             message: message,
                                                             preferredStyle: .actionSheet)

        /// Add sheet actions
        for i: Int in 0 ..< actions.count {
            sheetView.addAction(
                UIAlertAction(title: actions[i],
                              style: styles[actions[i]] ?? .default,
                              handler: { act in
                                  onSelect(sheetView, act, i)
                })
            )
        }

        // Show view
        present(sheetView, animated: true, completion: on)

        return sheetView
    }

    /// = view.frame.width
    var w: CGFloat {
        return view.frame.width
    }

    /// = view.frame.height
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

    /// view.frame.width - view.safeAreaInsets.right
    var mxX: CGFloat {
        return w - safe.right
    }

    /// view.frame.height - (tabBar height) - view.safeAreaInsets.bottom
    var mxY: CGFloat {
        return h - tab - bottom
    }

    /// Height of status bar
    var status: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }

    /// Height of navigation bar
    var nav: CGFloat {
        return (navigationController?.navigationBar.frame.height ?? 0)
    }

    /// = status + nav
    var top: CGFloat {
        return UIApplication.shared.statusBarFrame.height + (navigationController?.navigationBar.frame.height ?? 0)
    }

    /// = safearea.bottom
    var bottom: CGFloat {
        return safe.bottom
    }

    /// = tabbar height
    var tab: CGFloat {
        if hidesBottomBarWhenPushed {
            return 0
        }
        return navigationController?.tabBarController?.tabBar.frame.height ?? 0
    }

    /// EdgeInset which contains top safearea only
    var insTop: UIEdgeInsets {
        return UIEdgeInsets(top: safe.top, left: 0, bottom: 0, right: 0)
    }

    /// EdgeInset which contains bottom safearea only
    var insBottom: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: safe.bottom, right: 0)
    }

    /// view.safeAreaInsets
    var safe: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaInsets
        } else { // fallback
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}
