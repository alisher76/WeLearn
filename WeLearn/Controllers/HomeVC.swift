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
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var challengesCpllectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        challengesCpllectionView.delegate = self
        challengesCpllectionView.dataSource = self
        
        navigationItem.title = "WeLearn"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isOpaque = false
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 50)]
    }
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView { return 4 } else { return 6 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? HomeVCCell else {
                return UICollectionViewCell()
            }
            cell.layer.cornerRadius = 14
            cell.layer.transform = spring3DCoverFlow(frame: cell.frame)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newChallengeCell", for: indexPath) as? NewChallengeCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
    
}


extension HomeVC: UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            let width = Int(collectionView.frame.width - 40)
            let height = Int(collectionView.frame.height - 60)
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: (collectionView.frame.width) / 3, height: (collectionView.frame.height - 40))
        }
    }
    
    // ScrollViewDidSCroll Settings
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if let collectionV = scrollView as? UICollectionView {
            animateCell(collectionView: collectionV)
            return
        }
            let offsetY = scrollView.contentOffset.y
            if offsetY < 0 {
//                contentView.transform = CGAffineTransform(translationX: 0, y: offsetY)
//                phoneImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/2)
//                backgroundImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
//                titleLabel.transform = CGAffineTransform(translationX: 0, y: -offsetY/4)
//                bodyView.transform = CGAffineTransform(translationX: 0, y: -offsetY/5)
            }
            
            if offsetY > 2 {
                UIView.animate(withDuration: 2, animations: {
                    self.navigationController?.setNavigationBarHidden(false, animated: true)
                })
            } else {
                UIView.animate(withDuration: 2, animations: {
                    self.navigationController?.setNavigationBarHidden(true, animated: true)
                })
            }
        
        
    }
    
    func animateCell(collectionView: UICollectionView) {
        
        if collectionView == categoryCollectionView {
            for cell in collectionView.visibleCells as! [HomeVCCell] {
                
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame, to: view)
                
                //            if appHasWideScreenForView(view) {
                //                cell.layer.transform = spring3DCoverFlowLarge(frame: cellFrame)
                //
                //                let translationX = cellFrame.origin.x / 17
                //                cell.backgroundImageView.transform = CGAffineTransform(translationX: translationX, y: 0)
                //            } else {
                cell.layer.transform = spring3DCoverFlow(frame: cellFrame)
                
                let translationX = cellFrame.origin.x / 5
                cell.categoryImage.transform = CGAffineTransform(translationX: translationX, y: 0)
            }
        }
    }
}


