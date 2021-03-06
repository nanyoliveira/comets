//
//  ConnectionDisplayManager.swift
//  comets
//
//  Created by Matt Ariane Clarke on 29/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import Foundation
import UIKit

class ConnectionManager {
    
    static let sharedInstance : ConnectionManager = {
        let instance = ConnectionManager()
        return instance
    }()
    
    
   
    
    
    func hasConnection() ->Bool
    {
        let status = Reach().connectionStatus()
        
        switch status {
        case .offline:
            return false
        default:
            return true
        }
    }
    
}


