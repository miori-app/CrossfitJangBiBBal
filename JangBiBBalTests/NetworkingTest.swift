//
//  NetworkingTest.swift
//  JangBiBBalTests
//
//  Created by miori Lee on 2022/06/04.
//

import XCTest
@testable import JangBiBBal

class NetworkingTest: XCTestCase {

    var sut : ShoppingNetworkManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = ShoppingNetworkManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_getMaxNextNum를_호출시_totalItems수가_1000보다작을때_maxNum이_totalItems수를_반환하는지() {
        let totalItemsNum = 500
        let result = sut.getMaxNextNum(totalItemsNum)
        XCTAssertEqual(result, totalItemsNum)
    }
    func test_getMaxNextNum를_호출시_totalItems수가_1000보다클때_maxNum이_1000을_반환하는지() {
        let totalItemsNum = 10000
        let result = sut.getMaxNextNum(totalItemsNum)
        XCTAssertEqual(result, 1000)
    }
}
