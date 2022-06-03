//
//  ShoppingTableViewModel.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/06.
//

import Foundation

class ShoppingTableViewModel : ObservableVMProtocol {
    
    typealias T = ShoppingItems
    
    var errorMessage: Observable<String?> = Observable(nil)
    var error: Observable<Bool> =  Observable(false)
    
    var shoppingNetwork : ShoppingNetworkManager
    var storage: Observable<[ShoppingItems]> = Observable([])
    
    var responseData : ShoppingResponse = ShoppingResponse.EMPTY
    
    init(networkManager : ShoppingNetworkManager = ShoppingNetworkManager()) {
        self.shoppingNetwork = networkManager
    }
    
    func fetchData(_ query : String) {
        self.shoppingNetwork.getItmes("크로스핏 \(query)") { response in
            let observable = Observable(response)
            //value로 넘겨주기
            self.storage.value = observable.value.items
            self.responseData = observable.value
            //print("storage : \(self.storage.value)")
        }
    }
    
    func loadMoreData(_ query : String) {
        self.shoppingNetwork.next("크로스핏 \(query)", shoppingResponse: responseData) {
            var addedData = $0
            //addedData.items.insert(contentsOf: self.storage.value, at: 0)
            self.storage.value += addedData.items
            //self.storage.value = addedData.items
        }
    }
    
    func setError(_ message: String) {
        //
    }
    
}

