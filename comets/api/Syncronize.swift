//
//  Syncronize.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import Foundation
import Alamofire

protocol SyncronizeDelegate: class
{
    func receive(jsonanswer:JsonAnswer);
}


class Syncronize {
    
    
    var delegate:SyncronizeDelegate?
    
    
    func call()
    {
        Alamofire.request(ServerPath.serverURL).responseJSON { response in
            
            if(response.result.isSuccess)
            {
                
                let jAnswer: JsonAnswer = JsonAnswer(result: response.result.value)
                
                self.delegate?.receive(jsonanswer: jAnswer)
            }
            
        }
    }
    
}


struct ServerPath {
    static let serverURL = "https://data.nasa.gov/resource/y77d-th95.json"
}

