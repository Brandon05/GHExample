//
//  GHFilterTableViewCell.swift
//  GHExample
//
//  Created by Hugh A. Miles II on 1/26/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import UIKit

class GHFilterTableViewCell: UITableViewCell {

    @IBOutlet weak var filterName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
