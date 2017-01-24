//
//  TrendingCell.swift
//  GHExample
//
//  Created by Brandon Sanchez on 1/23/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import UIKit

class TrendingCell: UITableViewCell {

    @IBOutlet var ownerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var repo: RepoModel! {
        didSet {
            ownerLabel.text = repo.owner
            //print(repo.owner)
        }
    }

}
