//
//  TodoTableViewCell.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

final class TodoTableViewCell: UITableViewCell {
    
    var todo: Todo? {
        didSet {
            guard let todo = todo else { return }
            //contentLabel.text = todo.content
            dateLabel.text = todo.dateString
        }
    }
    
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
    
    lazy var switchButton: UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.tintColor = UIColor(red: 1.00, green: 0.75, blue: 0.41, alpha: 1.00)
        switchBtn.layer.cornerRadius = switchBtn.frame.height / 2.0
        switchBtn.isOn = false // 초기값
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        switchBtn.addTarget(self, action: #selector(onClickSwitch(sender: )), for: UIControl.Event.valueChanged)
        return switchBtn
    }()
    
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    @objc func onClickSwitch(sender: Any) {
        guard let todo else { return }
        if switchButton.isOn {
            contentLabel.textColor = .lightGray
            contentLabel.attributedText = todo.content?.strikeThrough()
            TodoManager.completedTodo(todo: todo, isCompleted: true)
        } else {
            contentLabel.textColor = .black
            contentLabel.attributedText = nil
            contentLabel.text = todo.content
            TodoManager.completedTodo(todo: todo, isCompleted: false)
        }
    }
    
    func setTodo(_ _todo: Todo) {
        todo = _todo
        guard let todo else { return }
        if todo.isCompleted {
            contentLabel.textColor = .lightGray
            contentLabel.attributedText = todo.content!.strikeThrough()
        } else {
            contentLabel.textColor = .black
            contentLabel.attributedText = nil
            contentLabel.text = todo.content
        }
        switchButton.isOn = todo.isCompleted
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        makeUI()
        stackViewMakeUI()
        switchViewMakeUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI() {
        stackView.addArrangedSubview(contentLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    func stackViewMakeUI() {
        contentView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    func switchViewMakeUI() {
        contentView.addSubview(switchButton)
        NSLayoutConstraint.activate([
            switchButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            switchButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ])
    }
}

