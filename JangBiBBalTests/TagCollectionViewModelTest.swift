//
//  TagCollectionViewModelTest.swift
//  JangBiBBalTests
//
//  Created by miori Lee on 2022/05/12.
//

import XCTest
@testable import JangBiBBal

class TagCollectionViewModelTest : XCTestCase {
    
    var sut : TagCollectionViewModel!
    var mockArr : [TagCellModel]!
    var mockStrArr : [String]!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = TagCollectionViewModel()
        mockArr = [TagCellModel(tagName: "mock0"),
                   TagCellModel(tagName: "mock1"),
                   TagCellModel(tagName: "mock2")
        ]
        mockStrArr = ["searchQuery1","searchQuery2","searchQuery3"]
     
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
        mockArr = nil
        mockStrArr = nil
        
    }
    
    func test_numberOftagArr를_호출시_배열의개수를_제대로_반환하는지() {
        let arr = mockArr
        sut.tagArr = arr!
        let result = sut.numberOftagArr
        XCTAssertEqual(result, 3)
    }
    
    func test_gettagName을_호출시_index가_0일때_배열의_0번째요소를_반환하는지() {
        let arr = mockArr
        sut.tagArr = arr!
        let wantedIndex = 0
        let result = sut.gettagName(index: wantedIndex)
        XCTAssertEqual(result, mockArr[wantedIndex])
    }
    
    func test_getSearchQueryFromTag을_호출시_0일때_배열의_0번째요소를_반환하는지() {
        let arr = mockStrArr
        sut.tagQueryArr = arr!
        let wantedIndex = 0
        let result = sut.getSearchQueryFromTag(index: wantedIndex)
        XCTAssertEqual(result, mockStrArr[wantedIndex])
    }

}
