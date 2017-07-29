//
//  CometTests.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import XCTest
@testable import comets



class CometTests: XCTestCase {
    

    
    func testCometCreation() {
        let dic = ["geolocation":
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
                              "year": "2012-01-01T00:00:00.000",
                              "fall": "Fell",
                              "nametype": "Valid",
                              "mass": "21", "recclass": "L5"
        ] as [String : Any];
        
        let comet = Comet().createFrom(dic: dic)
        
        XCTAssertEqual(comet!.name, "Aachen")
        XCTAssertEqual(comet!.mass, 21)
        XCTAssertEqual(comet!.lat, "6.08333")
        XCTAssertEqual(comet!.lon, "50.775")
        XCTAssertFalse(comet!.isValidComet(byDate: Date.returnDateFromString(dateString: "1801-01-01T00:00:00.000")), "not valid")
        
        XCTAssertNotNil(comet!)
    }
    
   
    
}
