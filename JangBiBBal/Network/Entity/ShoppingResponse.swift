//
//  ShoppingResponse.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/06.
//

import Foundation

struct ShoppingResponse : Decodable {
    let total : Int
    let items : [ShoppingItems]
}

struct ShoppingItems : Decodable {
    let title : String
    let link : String
    let image : String
    let lprice : String
    let brand : String
}

extension ShoppingResponse {
    static let EMPTY = ShoppingResponse(total: 0, items: [])
}
