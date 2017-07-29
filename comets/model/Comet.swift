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
    dynamic var mass = 0.0
    dynamic var lon = ""
    dynamic var lat = ""
    dynamic var id = ""
    dynamic var cyear = 0
    
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
            let massString:String =  String(dicMass)
            if let massInt = Double(massString)
            {
                self.mass = massInt
            }
        }
        
        if let geo = validData["geolocation"] as? Dictionary<String, Any>
        {
            
            if let coordinate = geo["coordinates"] as? Array<Any>
            {
                
                self.lat = "\(coordinate[0])"
                self.lon = "\(coordinate[1])"
            }
            
        }
        
        if let dicYear = validData["year"] as? String
        {
            let yearDate = Date.returnDateFromString(dateString: dicYear)
            self.cyear = Date.getYearFrom(date: yearDate)
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
    
    
    static func getYearFrom(date:Date) -> Int {
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        return year;
    }
    
}


struct Specifications {
    static let twoElevenString = "2011-01-01T00:00:00.000"
}

