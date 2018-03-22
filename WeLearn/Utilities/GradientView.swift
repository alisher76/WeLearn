//
//  GradientView.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 3/21/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit


@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topColar: UIColor = .blue {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = .blue {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [topColar.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

