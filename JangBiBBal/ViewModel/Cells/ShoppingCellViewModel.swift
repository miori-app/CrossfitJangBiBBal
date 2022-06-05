//
 //  ShoppingCellViewModel.swift
 //  JangBiBBal
 //
 //  Created by miori Lee on 2022/05/07.
 //
 import Foundation

 class ShoppingCellViewModel {

     func changeDataFormat(_ model : ShoppingItems) -> ShoppingCellModel {

         let image = URL(string: model.image)
         let link = URL(string: model.link)
         let title  = model.title.deleteMarkDown()
         let brand = model.brand.isEmpty ? " " : "🏛 브랜드 : \(model.brand)"
         let lprice = "💸 \(model.lprice) ~ "

         return ShoppingCellModel(title: title, link: link, image: image, lprice: lprice, brand: brand)

     }
 }
