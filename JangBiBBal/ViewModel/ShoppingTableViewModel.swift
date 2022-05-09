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
    
    init(networkManager : ShoppingNetworkManager = ShoppingNetworkManager()) {
        self.shoppingNetwork = networkManager
    }
    
    func fetchData(_ query : String) {
        self.shoppingNetwork.getItmes("크로스핏 \(query)") { response in
            let observable = Observable(response)
            //value로 넘겨주기
            self.storage.value = observable.value
            //print("storage : \(self.storage.value)")
        }
    }
    
    func setError(_ message: String) {
        //
    }
}

