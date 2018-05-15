//
//  sectionsCell.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 5/14/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class SectionsCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension SectionsCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SectionCollectionCell else { return UICollectionViewCell() }
        return cell
    }
}

class SectionCollectionCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
