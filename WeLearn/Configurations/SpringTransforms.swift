//
//  SpringTransforms.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 5/14/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit

public func spring3DRotate(degrees: Double) -> CATransform3D {
    let angle = CGFloat((degrees * Double.pi) / 180.0)
    var transform = CATransform3DMakeRotation(angle, 0, 1, 0)
    transform.m34 = -1.0/2500
    return transform
}

public func spring3DTranslate(x: CGFloat, y : CGFloat, z: CGFloat) -> CATransform3D {
    var transform = CATransform3DMakeTranslation(x, y, z)
    transform.m34 = -1.0/2500
    return transform
}

open class SpringAnimator: NSObject {
    var duration: TimeInterval
    var animation: String
    var dampingRatio: CGFloat
    
    init(duration: TimeInterval, animation: String, dampingRatio: CGFloat) {
        self.duration = 1
        self.animation = "Flip"
        self.dampingRatio = 0.8
    }
    
    func animate(animations: @escaping () -> Void) {
        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: dampingRatio) {
            animations()
        }
        animator.startAnimation()
    }
}
