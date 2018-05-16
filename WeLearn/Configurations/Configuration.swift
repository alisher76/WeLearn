//
//  Configuration.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 5/14/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit

public func spring3DCoverFlow(frame: CGRect) -> CATransform3D {
    let degrees = Double((-frame.origin.x) / 10)
    
    var scale = (1000 - (frame.origin.x - 160)) / 1000
    if scale > 1 {
        scale = 1
    }
    if scale < 0.4 {
        scale = 0.9
    }
    
    let scale3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
    return CATransform3DConcat(spring3DRotate(degrees: degrees), scale3D)
}

