//
//  ShoppingNetworkManager.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/06.
//

import Alamofire

class ShoppingNetworkManager {
    
    private let api = ShoppingAPI()
    //var searchedData : [ShoppingItems] = []
    var searchedData : ShoppingResponse = ShoppingResponse.EMPTY
    var addedData : ShoppingResponse = ShoppingResponse.EMPTY
    var startNum : Int = 1
    //[ShoppingItems]
    func getItmes(_ query : String , onCompleted : @escaping (ShoppingResponse) -> Void) {
        
        startNum = 1
        guard let url = api.searchItems(query: query, start: startNum).url else { return }
                
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding(), headers: ShoppingAPIHeader.HEADERS)
            .validate()
            .responseDecodable(of: ShoppingResponse.self) { response in
                switch response.result {
                case .success(let response):
                    //print(response.items)
                    self.searchedData = response
                    onCompleted(self.searchedData)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func next(_ query: String, shoppingResponse : ShoppingResponse, onCompleted: @escaping (ShoppingResponse) -> Void) {
        let totalItems : Int = shoppingResponse.total
        let maxNum : Int = getMaxNextNum(totalItems)
        startNum += 20
        guard let url = api.searchItems(query: query, start: startNum).url else {return}
        if startNum <= maxNum{
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding(), headers: ShoppingAPIHeader.HEADERS)
                .validate()
                .responseDecodable(of: ShoppingResponse.self) {
                    response in
                    switch response.result {
                    case .success(let response):
                        self.addedData = response
                        onCompleted(self.addedData)
                    case .failure(let error) :
                        print(error.localizedDescription)
                    }
                }
        } else {
            print("검색결과를 다 불러왔어요")
        }
    
    }
    
    func getMaxNextNum(_ totalItems : Int) -> Int {
        return totalItems > 1000 ? 1000 : totalItems
    }
}
