//
//  MapTest.swift
//  comets
//
//  Created by Matt Ariane Clarke on 29/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import XCTest
import MapKit
@testable import comets

class MapTest: XCTestCase, MapManagerDelegate {
    
    var ex:XCTestExpectation?
    var map: MKMapView!
    {
        get {
            return MKMapView()
        }
    }
    var cometCountry: String?
    {
        didSet{
            ex?.fulfill()
        }
    }
    
    
    func getCometLocation() -> (lat:String, lon:String)
    {
        return ("53.3593274", "-6.2787061")
    }
    
    
    func testSetLocation() {
       let manager = MapManager()
        XCTAssertFalse(manager.setCometLocation())
    }
    
    func testWithDelegate(){
        let manager = MapManager()
        manager.delegate = self
        
        XCTAssertTrue(manager.setCometLocation())
        
        
        ex = expectation(description: "set Country")
        waitForExpectations(timeout: 10) { [weak self] (error) in
            
            XCTAssertNotNil(self?.cometCountry!)
            XCTAssertEqual(self?.cometCountry!, "Ireland")
            
            
        }
        
    }
    

    
}



