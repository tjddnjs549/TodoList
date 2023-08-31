//
//  CompletedView.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/31.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {
     
    var todo: Todo?
    
    let contentLabel: UILabel = {
        let ctn = UILabel()
        ctn.textColor = .black
        ctn.font = UIFont.boldSystemFont(ofSize: 16)
        ctn.translatesAutoresizingMaskIntoConstraints = false
        return ctn
    }()
    
    let dateLabel: UILabel = {
        let date = UILabel()
        date.textColor = .black
        date.font = UIFont.systemFont(ofSize: 14)
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func setTodo(_ _todo: Todo) {
        todo = _todo
        guard let todo else { return }
        contentLabel.text = todo.content
        dateLabel.text = todo.dateString
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        makeUI()
        stackViewMakeUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI() {
        stackView.addArrangedSubview(contentLabel)
        stackView.addArrangedSubview(dateLabel)
        contentView.addSubview(stackView)
    }
    
    func stackViewMakeUI() {
        stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
    }

}
