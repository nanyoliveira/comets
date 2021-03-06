//
//  Syncronize.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import Foundation
import Alamofire

protocol SynchronizeDelegate: class
{
    func receive(jsonanswer:JsonAnswer)
    func dataSet()
    func checkConnection()
    
}


class ManageSynchronization {
    
    
    weak var delegate:SynchronizeDelegate?
    
    private let defaults = UserDefaults.standard
    
    private func setBeenOpenBefore() {
        defaults.set(true, forKey: SyncConstants.beenOpenedBefore)
    }
    
    private func setBeenOpenBeforeFalse() {
        defaults.set(false, forKey: SyncConstants.beenOpenedBefore)
    }
    
    private func hasBeenOpenedBefore() -> Bool {
        return defaults.bool(forKey: SyncConstants.beenOpenedBefore)
    }
    
    
    func checkData () {
        if(hasBeenOpenedBefore() == false)
        {
            setBeenOpenBefore()
            call()
        }
        else
        {
            delegate?.dataSet()
        }
    }
    
    func call()
    {
        guard ConnectionManager.sharedInstance.hasConnection() else {
            self.delegate?.checkConnection()
            setBeenOpenBeforeFalse()
            return
        }
        
        Alamofire.request(SyncConstants.serverURL()).responseJSON { response in
            
            if(response.result.isSuccess)
            {
                let jAnswer: JsonAnswer = JsonAnswer(result: response.result.value)
                self.delegate?.receive(jsonanswer: jAnswer)
            }
        }
    }
    
}


struct SyncConstants {
    
    public static func serverURL() ->String
    {
        let token = "Hfd3p4krdgOrIY15IGjvdZh4K"
        return "https://data.nasa.gov/resource/y77d-th95.json?$$app_token=\(token)"
    }
    
    static let beenOpenedBefore = "hasBeenOpenedBefore"
}

