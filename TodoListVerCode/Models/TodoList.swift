//
//  TodoList.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit


struct Todo {
    var content: String?
    private let date: Date = Date()
    
    
    var dateString: String? {
        get {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            
            formatter.dateStyle = .medium
            formatter.timeStyle = .full
            
            // 개발자가 직접 설정한
            formatter.dateFormat = "EEEE"
            
            return formatter.string(from: date)
        }
    }
    
}


