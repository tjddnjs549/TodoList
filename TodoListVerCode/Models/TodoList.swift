//
//  TodoList.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

enum TodoCategory: String, Codable, CaseIterable {
    case none
    case work
    case life
    
    func toIndex() -> Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
    static func category(index: Int) -> Self? {
        Self.allCases.indices ~= index ? Self.allCases[index] : nil
    }
}
struct Todo: Codable {
    var id: Int
    var category: TodoCategory
    var content: String?
    var isCompleted: Bool
    let date: Date
    
    
    var dateString: String? {
        get {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            
            formatter.dateStyle = .medium
            formatter.timeStyle = .full
    
            formatter.dateFormat = "EEEE"
            
            return formatter.string(from: date)
        }
    }
    
}


