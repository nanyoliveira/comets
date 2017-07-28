//
//  Comet.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import CoreLocation
import RealmSwift

class Comet:Object {
    
    dynamic var name = ""
    dynamic var mass = ""
    dynamic var lon = ""
    dynamic var lat = ""
    dynamic var id = ""
    
    
    /*
    let dic = ["geolocation":
        [
            "coordinates":[
                "6.08333",
                "50.775"
            ],
            "type" : "Point",
        ],
               
               "name": "Aachen",
               "reclat": "50.775000",
               "id": "1",
               "reclong": "6.083330",
               "year": "1880-01-01T00:00:00.000",
               "fall": "Fell",
               "nametype": "Valid",
               "mass": "21", "recclass": "L5"
        ] as [String : Any];
    
    
    */
    
    
    func createFrom(dic: Dictionary<String, Any> ) -> Comet?
    {
        if let year = dic["year"] as? String
        {
            
            if (isValidComet(byDate: Date.returnDateFromString(dateString: year))){
                createfrom(validData: dic)
                return self;
            }
        }
        
        return nil
    }
    
    
    
    private func createfrom(validData: Dictionary<String, Any>)
    {
        if let dicId = validData["id"] as? String
        {
            self.id = dicId
        }
        
        if let dicName = validData["name"] as? String
        {
            self.name = dicName
        }
        
        if let dicMass = validData["mass"] as? String
        {
            self.mass = dicMass
        }
        
        
        if let geo = validData["geolocation"] as? Dictionary<String, Any>
        {
            
            if let coordinate = geo["coordinates"] as? Array<String>
            {
                
                self.lat = coordinate[0]
                self.lon = coordinate[1]
            }
            
        }
        
    }
    
    
    
    internal func isValidComet(byDate:Date) -> Bool
    {
        let twoEleven = Date.returnDateFromString(dateString: Specifications.twoElevenString)
        return byDate >= twoEleven
    }

}


extension Date
{
    static func returnDateFromString(dateString:String) -> Date {
        
        
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateStringFormatter.date(from: dateString)!
        return d
    }
    
}


struct Specifications {
    static let twoElevenString = "2011-01-01T00:00:00.000"
}

