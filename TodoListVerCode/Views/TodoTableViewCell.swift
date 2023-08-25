//
//  TodoTableViewCell.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

final class TodoTableViewCell: UITableViewCell {
    
    private let content: UILabel = {
        let ctn = UILabel()
        ctn.translatesAutoresizingMaskIntoConstraints = false
        return ctn
    }()
    
    private let date: Date = {
        let date = Date()
        
        return date
    }()
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        
    }

    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
    }

    
    
    
    
}
