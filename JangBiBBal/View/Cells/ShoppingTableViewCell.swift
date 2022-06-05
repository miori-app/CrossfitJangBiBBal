//
 //  ShoppingTableViewCell.swift
 //  JangBiBBal
 //
 //  Created by miori Lee on 2022/05/06.
 //

 import Foundation
 import UIKit
 import SnapKit
 import Kingfisher

  class ShoppingTableViewCell : UITableViewCell {

      static let registerID = "\(ShoppingTableViewCell.self)"

      let itemImageView = UIImageView()
     let itemNameLabel = UILabel()
     let itemBrandLabel = UILabel()
     let itemPriceLabel = UILabel()

      let cellViewModel = ShoppingCellViewModel()

      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)

          setAttribute()
         setLayout()
     }

      required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

      private func setAttribute() {
         itemImageView.contentMode = .scaleToFill
         itemImageView.backgroundColor = .white
         itemNameLabel.font = .systemFont(ofSize: 14, weight: .bold)
         itemBrandLabel.font = .systemFont(ofSize: 11)
         itemBrandLabel.textColor = .darkGray
         [itemNameLabel,itemBrandLabel].forEach {$0.numberOfLines = 0 }
         itemPriceLabel.font = .systemFont(ofSize: 12, weight: .light)
     }

      private func setLayout() {
         [itemImageView,itemNameLabel,itemBrandLabel,itemPriceLabel].forEach {
             contentView.addSubview($0)
         }
         itemImageView.snp.makeConstraints {
             $0.top.equalTo(itemNameLabel)
             $0.leading.equalToSuperview().offset(20)
             $0.width.equalTo(contentView).multipliedBy(0.15)
             $0.height.equalTo(itemImageView.snp.width)//.multipliedBy(1.3)
         }
         itemNameLabel.snp.makeConstraints {
             $0.top.equalToSuperview().offset(12)
             $0.leading.equalTo(itemImageView.snp.trailing).offset(17.5)
             $0.trailing.equalToSuperview().inset(20)
         }
         itemBrandLabel.snp.makeConstraints {
             $0.top.equalTo(itemNameLabel.snp.bottom).offset(10)
             $0.leading.trailing.equalTo(itemNameLabel)
         }
         itemPriceLabel.snp.makeConstraints {
             $0.top.equalTo(itemBrandLabel.snp.bottom).offset(10)
             $0.leading.trailing.equalTo(itemNameLabel)
             $0.bottom.equalToSuperview().inset(12)
         }

      }

      func setData(_ model : ShoppingItems) {
         let _model = cellViewModel.changeDataFormat(model)
         itemImageView.kf.setImage(with: _model.image)
         itemNameLabel.text = _model.title
         itemBrandLabel.text = _model.brand
         itemPriceLabel.text = _model.lprice
     }

  }
