//
//  Comet.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import UIKit

class CometDetail: UIViewController {

    var comet:Comet?
    
    
    @IBOutlet weak var cometName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if comet != nil {
             self.populateView()
        }
        else
        {
            self.chuckNorisPopulate()
        }
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    private func populateView()
    {
        cometName.text = comet?.name
        countryName.text = "it fell around this country"
        
        
    }
    
    
    private func chuckNorisPopulate() {
        cometName.text = "Uh Oh!"
        countryName.text = "Chuck Norris kicked this comet away!"
        countryImage.image = UIImage(named: "chuckNorris")
    }
    


}
