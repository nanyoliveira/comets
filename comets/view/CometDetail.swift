//
//  Comet.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher


class CometDetail: UIViewController, MapManagerDelegate, FlickrDelegate {
 
    
    @IBOutlet weak var cometName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var map: MKMapView!

    @IBOutlet weak var cometMass: UILabel!
    @IBOutlet weak var cometYear: UILabel!
    
    
    @IBOutlet weak var countryImageHeight: NSLayoutConstraint!

    var comet:Comet?
    
    var cometCountry:String?
    {
        didSet{
            countryName.text = "It fell around \(cometCountry ?? "" )"
            setCountryImage()
        }
    }
    let mapM = MapManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mapM.delegate = self
        
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
        _ = mapM.setCometLocation()
        cometName.text = comet!.name
        cometMass.text = " \(comet!.mass)g"
        cometYear.text = " \(comet!.cyear)"
    }
    
    private func setCountryImage()
    {
        let flickr = FlickrImage()
        flickr.delegate = self
        flickr.researchRandonImage(countryToSearch: cometCountry!)
    }
    
    
    private func chuckNorisPopulate() {
        cometName.text = "Uh Oh!"
        countryName.text = "Chuck Norris kicked this comet away!"
        countryImage.image = UIImage(named: "chuckNorris")
    }
    
    
    private func reduceImage(){
        countryImage.image = nil
        
        UIView.animate(withDuration: 0.5, animations: {
            [unowned self] in
            self.countryImageHeight.constant = 10
            self.view.layoutIfNeeded()
            
            },completion: nil)
    }
    
    
    // delegates
    func getCometLocation() -> (lat:String, lon:String)
    {
        var latitude = "0.0"
        var longitude = "0.0"
        
        if let lat = comet?.lat{
            latitude = lat
        }
        
        if let lon = comet?.lon{
            longitude = lon
        }
        
        return (latitude, longitude)
    }
    
    
    func receiveImage(dictionary:Dictionary<String, Any>)
    {
        if let media = dictionary["media"] as? Dictionary<String, Any>
        {
            if let imageURLString = media["m"] as? String
            {
                
                let imageURL = URL(string: imageURLString)
                countryImage.kf.setImage(with: imageURL)
            }
        }
    }
    
    func noImageAvailable() {
        reduceImage()
    }
    
    func noInternet() {
        countryName.text = "It fell around the planet Earth"
        reduceImage()
    }
    
   
    
}
