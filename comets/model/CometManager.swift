//
//  CometManager.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import Foundation
import RealmSwift

class CometManager: SyncronizeDelegate {
    
    internal var data:Array<Dictionary<String, Any>>?
    private var realm:Realm?
    
    
    //Adding Data
    func receive(jsonanswer: JsonAnswer) {
        
        if let receivedData = jsonanswer.result as? Array<Dictionary<String, Any>>
        {
            self.data = receivedData
            realm  = try! Realm()
            convertData()
        }
    }
    
    private func convertData() {
        for cometSpecifics in data!
        {
            let comet:Comet? = Comet().createFrom(dic: cometSpecifics)
            
            if comet != nil
            {
                //check if data is already there
                if(!idExists(id: comet!.id))
                {
                    addOnRealm(comet: comet!)
                }
            }
        }
        
        let notification = Notification(name: Notification.Name(rawValue: ThreadNotifications.dataReady))
        NotificationCenter.default.post(notification)
        
    }
    
    
    private func addOnRealm(comet:Object)
    {
        realm?.beginWrite()
        realm?.add(comet)
        try! realm?.commitWrite()
    }
    
    
    private func idExists(id:String) -> Bool
    {
        let idResult = realm?.objects(Comet.self).filter(NSPredicate(format: "id contains '\(id)'"))
        if idResult != nil && idResult!.count > 0
        {
            return true
        }
        
        return false
    }
    
    
    
    
    //Managing data
    
    
    
}


struct ThreadNotifications {
    static let dataReady = "DataReady"
}
















