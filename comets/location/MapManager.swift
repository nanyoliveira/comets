//
//  MapManager.swift
//  comets
//
//  Created by Matt Ariane Clarke on 29/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

protocol MapManagerDelegate: class
{
    
    var map: MKMapView! { get }
    var cometCountry: String? { get set }
    
    func getCometLocation() -> (lat:String, lon:String)

}



class MapManager {

    
    var delegate:MapManagerDelegate?
    private var cometLocation:CLLocation?
    {
        didSet
        {
            findLocation()
        }
    }
    

     func setCometLocation()
    {
        guard delegate != nil else
        {
          print("no delegate")
            return
        }
        
        
        cometLocation = CLLocation(latitude: validLatitude((delegate?.getCometLocation().lat)!),
                                    longitude: validLongitude((delegate?.getCometLocation().lon)!))
    }
    
    
 
    
    private func findLocation()  {
        
        dropPin()
        
        
        if ConnectionManager.sharedInstance.hasConnection()
        {
            findCountry()
        }
    }
    
    
    
    private func findCountry ()
    {
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(cometLocation!)
        {
            [unowned self]
            (placemarks, error) in
            
            let placeArray = placemarks as [CLPlacemark]!
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placeArray?[0]
            
            
            
            if let foundCountry = placeMark.addressDictionary?["Country"] as? String
            {
                self.delegate?.cometCountry = foundCountry
            }
            
        }
    }
    
    private func dropPin()
    {
        
        let cometPin = MKPointAnnotation()
        cometPin.coordinate = cometLocation!.coordinate
        delegate?.map.addAnnotation(cometPin)
        
        
        //show pin area
        delegate?.map.setCenter(cometLocation!.coordinate, animated: true)
    }
    
    
    private func validLatitude(_ lat:String)->Double
    {
        return Double(lat)!
    }
    private func validLongitude(_ lon:String)->Double
    {
        return Double(lon)!
    }
    
    
}



struct mapConstants {
    static let mapRadios:CLLocationDistance = 2000
    static let maxLatitude = 90.0
    static let minLatitude = -90.0
    static let maxLongitude = 180
    static let minLongitude = -180
}



