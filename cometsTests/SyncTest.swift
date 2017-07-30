//
//  SyncTest.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import XCTest
@testable import comets

class SyncTest: XCTestCase, SynchronizeDelegate {

    var sync:ManageSynchronization?
    var ex:XCTestExpectation?
    var data:JsonAnswer?
    
    override func setUp() {
        super.setUp()
        sync = ManageSynchronization()
        sync?.delegate = self
    }

    func testServerResponse ()
    {
        
        sync?.call()
        ex = expectation(description: "received data")
        waitForExpectations(timeout: 10) { (error) in
            
            XCTAssertNotNil(self.data)
        }

    }
    
    
    func testPerformanceCall() {
        // This is an example of a performance test case.
        self.measure {
            self.sync?.call()
            
        }
    }
    
    func testPerformanceCheck() {
        // This is an example of a performance test case.
        self.measure {
            self.sync?.checkData()
            
        }
    }
    
    
    func receive(jsonanswer:JsonAnswer){
        data = jsonanswer
        ex?.fulfill()
    }
    
    func dataSet()
    {
        
    }
    
}
