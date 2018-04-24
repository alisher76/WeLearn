//
//  HomeVC.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 3/21/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeVCCell else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 14
        return cell
    }
    
}


extension HomeVC: UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(collectionView.frame.width - 40)
        let height = Int(collectionView.frame.height - 100)
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if let collectionV = scrollView as? UICollectionView {
            for cell in collectionV.visibleCells as! [HomeVCCell] {
                let indexPath = collectionV.indexPath(for: cell)!
                let attributes = collectionV.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionV.convert(attributes.frame, to: view)
                
                let translationX = cellFrame.origin.x / 5
                cell.categoryImage.transform = CGAffineTransform(translationX: translationX, y: 0)
                
                let andleFromX = Double((-cellFrame.origin.x) / 8)
                let angle = CGFloat((andleFromX * Double.pi) / 100.0)
                
                var transform = CATransform3DIdentity
                transform.m34 = -1.0/1000
                let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
                cell.layer.transform = rotation
                
                // get a value between 1 and 0
                var scaleFromX = (1000 - (cellFrame.origin.x - 200)) / 1000
                let scaleMax: CGFloat = 1.0
                let scaleMin: CGFloat = 0.4
                if scaleFromX > scaleMax {
                    scaleFromX = scaleMax
                }
                if scaleFromX < scaleMin {
                    scaleFromX = scaleMin
                }
                
                let scale = CATransform3DScale(CATransform3DIdentity, scaleFromX, scaleFromX, 1)
                cell.layer.transform = scale
            }
        }
    }
}

