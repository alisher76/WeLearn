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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeVCCell else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 14
        cell.layer.transform = spring3DCoverFlow(frame: cell.frame)
        return cell
    }
    
}


extension HomeVC: UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(collectionView.frame.width - 40)
        let height = Int(collectionView.frame.height - 60)
        return CGSize(width: width, height: height)
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

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? SectionsCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        
        let lineView = UIView()
        lineView.backgroundColor = .white
        lineView.frame = CGRect(x: 2, y: 0, width: 2, height: 28)
        view.addSubview(lineView)
        
        let btn = UIButton()
        btn.frame = CGRect(x: (self.view.frame.width - 60), y: 5, width: 15, height: 15)
        btn.backgroundColor = .clear
        btn.setImage(UIImage(named: "nextWhite")!, for: .normal)
        view.addSubview(btn)
        
        let label = UILabel()
        label.text = "section\(section)"
        label.textColor = .white
        label.frame = CGRect(x: 30, y: 2.5, width: 100, height: 30)
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
}
