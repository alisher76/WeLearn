//
//  CourseCell.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 3/21/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class CourseCell: UICollectionViewCell {
    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        courseImage.roundCornersForAspectFit(radius: 5.0)
        
        courseView.addShadow(offset: CGSize(width: 0, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
    }
}
