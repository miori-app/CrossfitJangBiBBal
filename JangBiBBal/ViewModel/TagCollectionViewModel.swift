//
//  TagCollectionViewModel.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/05.
//

import Foundation
import UIKit

class TagCollectionViewModel  {

    let tagCellData = TagCellData()
    var tagArr : [TagCellModel]
    var tagQueryArr : [String]
    let tagBackgroundColorArr : [UIColor]
    
    let defaultItemIdx : Int = 0
    
    init() {
        tagArr = tagCellData.getTagCellDummyData()
        tagBackgroundColorArr = tagCellData.makeCellBackgroundColorArr()
        tagQueryArr = tagCellData.getTagCellSearchQuery()
    }
    
    var numberOftagArr: Int {
        return tagArr.count
    }
    
    func gettagName(index: Int) -> TagCellModel {
        return tagArr[index]
    }
    
    func gettagBackgroundColor(index : Int) -> UIColor {
        return tagBackgroundColorArr[index % (tagArr.count-1)]
    }
    
    func getSearchQueryFromTag(index : Int) -> String {
        return tagQueryArr[index]
    }
}
