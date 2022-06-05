//
//  TagCellData.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/05.
//

import Foundation
import UIKit

class TagCellData {
    func getTagCellDummyData() -> [TagCellModel] {
        return  [
            TagCellModel(tagName: "🤸‍♀️ 그립 (손바닥 보호대)"),
            TagCellModel(tagName: "🏋️‍♂️ 무릎 보호대"),
            TagCellModel(tagName: "👟 메트콘"),
            TagCellModel(tagName: "👟 줄넘기"),
            TagCellModel(tagName: "🏋️‍♂️ 허리보호대")
        ]
    }
    
    func getTagCellSearchQuery() -> [String] {
        return ["그립","무릎 보호대","메트콘","줄넘기","허리보호대"]
    }
    
    func makeCellBackgroundColorArr() -> [UIColor] {
        return [.pmint, .ppink, .pgreen, .ppurple]
    }
}
