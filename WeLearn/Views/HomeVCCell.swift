//
//  HomeVCCell.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 3/21/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class HomeVCCell: UICollectionViewCell {
    
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryDescriptionLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundCornersForAspectFit(radius: 0.5)
    }
}

