//
//  String.swift
//  JangBiBBal
//
//  Created by miori Lee on 2022/05/07.
//

import Foundation
//https://stackoverflow.com/questions/25983558/stripping-out-html-tags-from-a-string
extension String {

    // MARK: html 스타일 제거
    func deleteMarkDown() -> String? {
        do {
            guard let data = self.data(using: .utf8) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
}
