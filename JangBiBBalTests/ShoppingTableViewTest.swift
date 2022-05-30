//
//  ShoppingTableViewTest.swift
//  JangBiBBalTests
//
//  Created by miori Lee on 2022/05/12.
//

import XCTest
@testable import JangBiBBal

class ShoppingTableViewTest : XCTestCase {
    
    var sut : MainViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = MainViewController()
     
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        
    }
    
    func testwhenViewDidLoad() {
        sut.viewDidLoad()
        
        let naviTitle = "장비빨로 pr 가즈아"
  
    }
    
}
