//
//  ShoppingBackgroundView.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/06/07.
//

import Foundation
import UIKit
import SnapKit

class ShoppingBackgroundView : UIView {
    let statusLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAttribute()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setAttribute(){
        self.backgroundColor = .white
        statusLabel.text = "🤸‍♀️🏋🏻‍♀️\n데이터를 로드중이예요..."
        statusLabel.numberOfLines = 0
        statusLabel.textAlignment = .center
    }
    private func setLayout(){
        addSubview(statusLabel)
        statusLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    func bind(_ viewModel : ShoppingBackgroundViewModel) {
        viewModel.isHidden.bind { [weak self] state in
            guard let self = self else {
                return
            }
            self.statusLabel.isHidden = state
        }
    }
}
