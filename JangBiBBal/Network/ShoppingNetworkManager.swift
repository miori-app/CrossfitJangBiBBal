//
//  ShoppingNetworkManager.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/06.
//

import Alamofire

class ShoppingNetworkManager {
    
    private let api = ShoppingAPI()
    var searchedData : [ShoppingItems] = []
    
    func getItmes(_ query : String , onCompleted : @escaping ([ShoppingItems]) -> Void) {
        
        guard let url = api.searchItems(query: query).url else { return }
                
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding(), headers: ShoppingAPIHeader.HEADERS)
            .validate()
            .responseDecodable(of: ShoppingResponse.self) { response in
                switch response.result {
                case .success(let response):
                    //print(response.items)
                    self.searchedData = response.items
                    onCompleted(self.searchedData)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
