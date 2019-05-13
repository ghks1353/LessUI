//
//  TransUIViewExt.swift
//  LessUI
//
//  Created by Seru on 09/04/2019.
//

import Foundation
import pop
import UIKit

public extension UIView {
    /// showing view from left
    @discardableResult
    func appearLR(offset _: CGFloat = 24, dur _: TimeInterval = 0.32, alpha _: CGFloat = 1) -> Self {
        return self
    }

    /// Pause all animation
    @discardableResult
    func stopAnim() -> Self {
        pop_removeAllAnimations()
        return self
    }

    /// transition view with spring animation
    @discardableResult
    func trans(offX: CGFloat = 0, offY: CGFloat = 0,
               addX _: CGFloat = 0, addY _: CGFloat = 0,
               speed: CGFloat = 12,
               delay: TimeInterval = 0,
               alpha: CGFloat? = nil,
               
               on: @escaping () -> Void = {}) -> Self {
        let startPos: CGRect = CGRect(x: frame.minX - offX, y: frame.minY - offY, width: frame.width, height: frame.height)
        let endPos: CGRect = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height)

        let anim: POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPViewFrame)

        anim.fromValue = startPos
        anim.toValue = endPos

        anim.velocity = CGRect(x: 1.42, y: 1.42, width: 1.42, height: 1.42)
        anim.springSpeed = speed
        anim.springBounciness = 2

        anim.beginTime = CACurrentMediaTime() + delay

        anim.completionBlock = { _, _ in on() }

        frame = startPos
        pop_add(anim, forKey: "trans-\(Float.random(in: 0 ..< 1))")

        // Run alpha animation if avail
        if alpha != nil {
            return opacity(from: 0, to: alpha ?? 0, dur: TimeInterval(speed / 30), delay: delay, on: on)
        }

        return self
    }

    /// Opacity with animation
    @discardableResult
    func opacity(from: CGFloat? = nil,
                 to: CGFloat = 1,
                 dur: TimeInterval = 0.32,
                 delay: TimeInterval = 0,
                 
                 on: @escaping () -> Void = {}) -> Self {
        let anim: POPBasicAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)

        if from != nil {
            anim.fromValue = from ?? 0
            alpha = from ?? 0
        }
        anim.toValue = to

        anim.duration = dur
        anim.beginTime = CACurrentMediaTime() + delay

        anim.completionBlock = { _, _ in on() }

        pop_add(anim, forKey: "opacity-\(Float.random(in: 0 ..< 1))")

        return self
    }
}
