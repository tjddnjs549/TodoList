//
//  TodoTableViewCell+String.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit


extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
