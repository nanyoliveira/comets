//
//  FlickImageTest.swift
//  comets
//
//  Created by Matt Ariane Clarke on 29/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import XCTest
@testable import comets

class FlickImageTest: XCTestCase, FlickrDelegate {
    
    let flickr = FlickrImage()
    var ex:XCTestExpectation?
    
    func testResearch() {
        
        flickr.delegate = self
        
        flickr.researchRandonImage(countryToSearch: "Comets")
    
        ex = expectation(description: "received data")
        waitForExpectations(timeout: 10) { (error) in
            
            XCTAssertNotNil(self.dic)
            XCTAssertTrue(self.imageAvailable)
            XCTAssertTrue(self.internet)
        }
    }
    
    func testPerformanceResearch() {
        
        self.measure {
            self.flickr.researchRandonImage(countryToSearch: "Comets")
        }
    }
    
    
    var dic:Dictionary<String, Any>?
    var imageAvailable:Bool = true
    var internet:Bool = true
    
    
    func receiveImage(dictionary:Dictionary<String, Any>)
    {
        dic = dictionary
        ex?.fulfill()
    }
    
    func noImageAvailable()
    {
        imageAvailable = false
    }
    
    func noInternet()
    {
        internet = false
    }
    
}




