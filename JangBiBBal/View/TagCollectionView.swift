//
//  TagCollectionView.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/04.
//

import Foundation
import UIKit

class TagCollectionView : UICollectionView {
    
    let flowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        
        setAttribute()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TagCollectionView {
    private func setAttribute() {
        self.backgroundColor = .yellow
    }
}
