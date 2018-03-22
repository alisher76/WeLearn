//
//  UIView.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 3/21/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit


extension UIView {
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.cornerRadius = radius
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
