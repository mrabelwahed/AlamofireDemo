//
//  CustomCell.swift
//  AlamofireDemo
//
//  Created by Mahmoud Ramadan on 12/23/17.
//  Copyright © 2017 Mahmoud Ramadan. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
