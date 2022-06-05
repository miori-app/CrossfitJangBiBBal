//
//  JangBiBBalUITests.swift
//  JangBiBBalUITests
//
//  Created by miori Lee on 2022/05/03.
//

import XCTest

class JangBiBBalUITests: XCTestCase {
    
    var targetApp : XCUIApplication!
    
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        targetApp = XCUIApplication()
        targetApp.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        
        targetApp = nil
    }
    
    func testNavigationBarTitle() {
        let existNaviationBar = targetApp.navigationBars["장비빨로 pr 가즈아"].exists
        XCTAssertTrue(existNaviationBar)
    }
    
}
