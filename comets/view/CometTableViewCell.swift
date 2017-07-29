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
    

    
    func setData (comet:Comet) {
        cometName.text = comet.name
        cometMass.text = " \(comet.mass)"
        cometYear.text = " \(comet.cyear)"
        
    }
}
