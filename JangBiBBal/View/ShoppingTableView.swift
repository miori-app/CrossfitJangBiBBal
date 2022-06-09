//
 //  ShoppingTableView.swift
 //  JangBiBBal
 //
 //  Created by miori Lee on 2022/05/06.
 //
 import Foundation
 import UIKit

 class ShoppingTableView : UITableView {
     
     let customBackgroundView = ShoppingBackgroundView()
     override init(frame: CGRect, style: UITableView.Style) {
         super.init(frame: frame, style: .plain)

         setTableView()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     private func setTableView() {
         self.backgroundColor = .white
         self.register(ShoppingTableViewCell.self, forCellReuseIdentifier: ShoppingTableViewCell.registerID)
         self.rowHeight = UITableView.automaticDimension
         self.estimatedRowHeight = ScreenConstant.deviceHeight * 0.12
         self.separatorStyle = .singleLine
         self.backgroundView = customBackgroundView
     }

     func bind(_ viewModel : ShoppingTableViewModel) {
         viewModel.storage.bind { [weak self] _ in
             guard let self = self else { return }
             DispatchQueue.main.async {
                 self.reloadData()
                 viewModel.realodFinish()
             }
         }
     }
     
     func backGroundViewbind(_ viewModel : ShoppingTableViewModel) {
         viewModel.backgroundVM.isHidden.bind { [weak self] boolVal in
             guard let self = self else { return }
             self.customBackgroundView.statusLabel.isHidden = boolVal
         }
     }
 }
