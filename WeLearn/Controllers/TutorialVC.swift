//
//  TutorialVC.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 3/22/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @IBAction func dissmissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension TutorialVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "textCell", for: indexPath) as? TutorialTextCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCell", for: indexPath) as? TuorialTableViewCell else {
                return UICollectionViewCell()
        }
            return cell
        }
    }
     
}
