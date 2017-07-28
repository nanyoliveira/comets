//
//  CometManagerTest.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import XCTest
@testable import comets

class CometManagerTest: XCTestCase {
    
    var dataComet:JsonAnswer?
    var manager:CometManager?
    var testArray:Array<Any>?
    var jans:JsonAnswer?
    
    
    
    override func setUp() {
        super.setUp()
        manager = CometManager();
        
        let dic1 = ["geolocation":
                        [
                            "coordinates" : [
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
        
        
        let dic2 = ["geolocation":
            [
                "coordinates" : [
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
        
        testArray = [dic1, dic2]
        jans = JsonAnswer(result: testArray)
        
    }
    
    
    func testConversion() {
        
        manager?.receive(jsonanswer: jans!)
        
        XCTAssertNotNil(manager?.data)
        XCTAssertEqual(manager?.data?.count, 2)
        
        
    }
    
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            
            self.manager?.receive(jsonanswer: self.jans!)
            // Put the code you want to measure the time of here.
        }
    }
    
}
