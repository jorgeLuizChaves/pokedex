//
//  EnvironmentTest.swift
//  pokedex
//
//  Created by Jorge Luiz on 6/4/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import XCTest
@testable import pokedex


class EnvironmentTest: XCTestCase {
    
    
    
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsProduction() {
        var envProd : Environment
        var envStaging : Environment
        var envDev : Environment
        
        envProd = Environment.PRODUCTION
        envDev = Environment.DEVELOPMENT
        envStaging = Environment.STAGING
        
        XCTAssertTrue(envProd.isProd())
        XCTAssertFalse(envProd.isDev())
        XCTAssertFalse(envProd.isStaging())
    }
}