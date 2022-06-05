//
//  TagCell.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/05.
//

import Foundation
import UIKit
import SnapKit

class TagCell : UICollectionViewCell {
    
    static let registerID = "\(TagCell.self)"
    
    let tagLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAttribute()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
            didSet {
                self.layer.borderColor = isSelected ?  UIColor.systemBlue.cgColor : UIColor.white.cgColor
                self.layer.borderWidth = isSelected ? 2.0 : 0.0
            }
        }
    
}

extension TagCell {
    private func setAttribute() {
        self.addSubview(tagLabel)
        self.layer.cornerRadius = self.frame.height * 0.5
        self.layer.masksToBounds = true
        tagLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
    }
    private func setLayout() {
        tagLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func setData(_ model : TagCellModel) {
        tagLabel.text = model.tagName
    }
    
    func setBackgroundColor(_ color : UIColor) {
        self.backgroundColor = color
    }
}
