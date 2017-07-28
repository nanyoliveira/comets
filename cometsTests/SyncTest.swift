//
//  SyncTest.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import XCTest
@testable import comets

class SyncTest: XCTestCase {

    var sync:Syncronize?
    
    override func setUp() {
        super.setUp()
        sync = Syncronize()
    }
    
    

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            self.sync?.call()
            
        }
    }
    
}
