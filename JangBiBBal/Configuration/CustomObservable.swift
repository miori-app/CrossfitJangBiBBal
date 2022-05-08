//
//  CustomObservable.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/06.
//

import Foundation

class Observable<T> {
    // 3) 호출되면, 2번에서 받은 값을 전달한다.
    private var listener: ((T) -> Void)?
    
    // 2) 값이 set되면, listener에 해당 값을 전달한다,
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    // 1) 초기화함수를 통해서 값을 입력받고, 그 값을 "value"에 저장한다.
    init(_ value: T) {
        self.value = value
    }
    
    // 4) 다른 곳에서 bind라는 메소드를 호출하게 되면,
    // value에 저장했떤 값을 전달해주고,
    // 전달받은 "closure" 표현식을 listener에 할당한다.
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
/* ref : https://velog.io/@kipsong/iOSDesignPattern-MVVM-과-DataBinding에-대한-간략한-소개
 */

protocol ObservableVMProtocol {
    associatedtype T
    
    // 데이터를 가져옵니다.
    func fetchData(_ query : String)
    
    // 에러를 처리합니다.
    func setError(_ message: String)
    
    // 원본데이터
    var storage: Observable<[T]> { get set }
    
    // 에러 메세지
    var errorMessage: Observable<String?> { get set }
    
    // 에러
    var error: Observable<Bool> { get set }
}
