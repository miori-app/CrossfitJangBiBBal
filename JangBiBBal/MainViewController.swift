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
    let tagCVVM = TagCollectionViewModel()
    
    let shoppingTV = ShoppingTableView()
    let shoppingTVVM =  ShoppingTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        setLayout()
        setupData()
        setTableView()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        let cvIndexPath = IndexPath(row: 0, section: 0)
//        tagCV.selectItem(at: cvIndexPath, animated: false, scrollPosition: .left)
//    }
}

extension MainViewController {
    private func setAttribute() {
        self.title = NaviTitle.mainTitle
        view.backgroundColor = .white
        
        tagCV.delegate = self
        tagCV.dataSource = self
    }
    private func setLayout() {
        [tagCV,shoppingTV].forEach { self.view.addSubview($0) }
        tagCV.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.08)
        }
        shoppingTV.snp.makeConstraints {
            $0.top.equalTo(tagCV.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    private func setupData() {
        shoppingTVVM.fetchData("그립")
    }
    private func setTableView() {
        shoppingTV.delegate = self
        shoppingTV.dataSource = self
        shoppingTV.bind(shoppingTVVM)
    }
}


extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagCVVM.numberOftagArr
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.registerID, for: indexPath) as? TagCell else {
            return UICollectionViewCell()
        }
        let tagName = tagCVVM.gettagName(index: indexPath.row)
        let tagBackgroundColor = tagCVVM.gettagBackgroundColor(index: indexPath.row)
        cell.setData(tagName)
        cell.setBackgroundColor(tagBackgroundColor)
        if indexPath.row == tagCVVM.defaultItemIdx {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        cell.isSelected = indexPath.row == tagCVVM.defaultItemIdx
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let query = tagCVVM.getSearchQueryFromTag(index: indexPath.row)
        shoppingTVVM.fetchData(query)
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tagName = tagCVVM.gettagName(index: indexPath.row).tagName
        let cellWidth = tagName.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]).width + 25
        let cellHeight = collectionView.frame.height * 0.6
        let cellSize = CGSize(width: cellWidth, height: cellHeight)
        
        return cellSize
    }
}

extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingTVVM.storage.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.registerID, for: indexPath) as? ShoppingTableViewCell else {
            return UITableViewCell()
        }
        let shoppingItem  = shoppingTVVM.storage.value[indexPath.row]
        
        cell.setData(shoppingItem)
        return cell
    }
}
