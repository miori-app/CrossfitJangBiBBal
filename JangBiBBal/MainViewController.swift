//
//  MainViewController.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/03.
//

import Foundation
import UIKit

class MainViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
    }
}

extension MainViewController {
    private func setAttribute() {
        self.title = NaviTitle.mainTitle
        view.backgroundColor = .white
    }
}
