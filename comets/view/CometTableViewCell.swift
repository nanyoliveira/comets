//
//  CometTableViewCell.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import UIKit

class CometTableViewCell: UITableViewCell {

    @IBOutlet weak var cometName: UILabel!
    @IBOutlet weak var cometMass: UILabel!
    @IBOutlet weak var cometYear: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
