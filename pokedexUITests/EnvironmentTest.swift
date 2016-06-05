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
        let envProd = Environment.PRODUCTION
        
        XCTAssertTrue(envProd.isProd())
        XCTAssertFalse(envProd.isDev())
        XCTAssertFalse(envProd.isStaging())
    }
    
    func testIsDev() {
        let envProd = Environment.DEVELOPMENT
        
        XCTAssertTrue(envProd.isDev())
        XCTAssertFalse(envProd.isProd())
        XCTAssertFalse(envProd.isStaging())
    }
    
    func testIsStaging() {
        let envProd = Environment.STAGING
        
        XCTAssertTrue(envProd.isStaging())
        XCTAssertFalse(envProd.isDev())
        XCTAssertFalse(envProd.isProd())
    }
    
    
}