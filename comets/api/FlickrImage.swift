//
//  FlickrImage.swift
//  comets
//
//  Created by Matt Ariane Clarke on 29/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import Foundation
import Alamofire


protocol FlickrDelegate: class
{
    func receiveImage(dictionary:Dictionary<String, Any>)
    func noImageAvailable()
    func noInternet()
}



class FlickrImage {
    
    weak var delegate:FlickrDelegate?
    
    
    
    func researchRandonImage(countryToSearch:String) {
        
        guard ConnectionManager.sharedInstance.hasConnection() else {
            delegate?.noInternet()
            return
        }
        
        let tag = countryToSearch.replacingOccurrences(of: " ", with: "")
        let flickrConst = flickrConstant()
        let url = flickrConst.taggedSearch(tag: tag)
        
        Alamofire.request(url).responseJSON { response in
            
            if(response.result.isSuccess)
            {
                if let responseValue = response.result.value as? Dictionary<String, Any>
                {
                    if let items = responseValue[flickrConstant.flickrItems] as? Array<Any>
                    {
                        if let firstValue = items[items.getTotalRandom()] as? Dictionary<String, Any>
                        {
                            self.delegate?.receiveImage(dictionary:firstValue)
                        }
                    }
                }
            }
            else {
                self.delegate?.noImageAvailable()
            }
        }
    }
    
    
}

extension Array
{
    func getTotalRandom() -> Int {
        let total = UInt32(self.count)
        let random = Int(arc4random_uniform(total))
        return random
    }
}


struct flickrConstant {
    
    public func taggedSearch(tag:String) ->String
    {
        return "https://api.flickr.com/services/feeds/photos_public.gne?tags=\(tag)&;tagmode=any&format=json&nojsoncallback=1"
    }
    
    
    public static let flickrItems = "items"
}
