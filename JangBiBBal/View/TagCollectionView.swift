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
        self.backgroundColor = .systemGray5
        self.showsHorizontalScrollIndicator = false
        self.register(TagCell.self, forCellWithReuseIdentifier: TagCell.registerID)
        self.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
    }
}
