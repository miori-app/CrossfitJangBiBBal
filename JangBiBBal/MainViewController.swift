//
//  MainViewController.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/03.
//

import Foundation
import UIKit
import SnapKit

class MainViewController : UIViewController {
    
    let tagCV = TagCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        setLayout()
    }
}

extension MainViewController {
    private func setAttribute() {
        self.title = NaviTitle.mainTitle
        view.backgroundColor = .white
    }
    private func setLayout() {
        [tagCV].forEach { self.view.addSubview($0) }
        tagCV.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.08)
        }
    }
}
