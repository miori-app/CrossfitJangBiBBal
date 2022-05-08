//
//  ShoppingAPI.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/06.
//

import Foundation
import Alamofire

struct ShoppingAPI {
    //https://openapi.naver.com/v1/search/shop.json?query=
    static let scheme = "https"
    static let host = "openapi.naver.com"
    static let path = "/v1/search/shop.json"
    
    func searchItems(query: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = ShoppingAPI.scheme
        components.host = ShoppingAPI.host
        components.path = ShoppingAPI.path
        components.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "display", value: "20")
        ]
        return components
    }
}

struct ShoppingAPIHeader {
    static var HEADERS : HTTPHeaders = [
        "X-Naver-Client-Id" : NaverAPIKeys.clientID,
        "X-Naver-Client-Secret" : NaverAPIKeys.clientSecret
    ]
}
