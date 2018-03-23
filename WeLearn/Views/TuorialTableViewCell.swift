//
//  TuorialTableViewCell.swift
//  WeLearn
//
//  Created by Alisher Abdukarimov on 3/22/18.
//  Copyright © 2018 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class TuorialTableViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension TuorialTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? OptionTableCell else {
            return UITableViewCell()
        }
        return cell
    }
}

class OptionTableCell: UITableViewCell {
    
    override func awakeFromNib() {
        
    }
}
