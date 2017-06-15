//
//  SearchResultsTableViewCell.swift
//  EPex_Mobile_2
//
//  Created by Apple on 6/15/17.
//  Copyright © 2017 GeneralElectric. All rights reserved.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {
    
    @IBOutlet var projectNameLabel: UILabel!
    @IBOutlet var ownerLabel: UILabel!
    @IBOutlet var commitDateLabel: UILabel!
    @IBOutlet var actualDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
