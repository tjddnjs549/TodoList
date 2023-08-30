//
//  TodoTableViewCell.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

final class TodoTableViewCell: UITableViewCell {
    
    //MARK: - 멤버 저장속성 구현
    // 멤버가 변할때마다 자동으로 업데이트 되도록 구현 didSet(속성 감시자) ⭐️
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
        switchBtn.tintColor = UIColor(red: 1.00, green: 0.75, blue: 0.41, alpha: 1.00) //바 색 조정
        switchBtn.layer.cornerRadius = switchBtn.frame.height / 2.0 // 디폴트값: 직사각형임
        switchBtn.isOn = false // 초기값
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        switchBtn.addTarget(self, action: #selector(onClickSwitch(sender: )), for: UIControl.Event.valueChanged)
        return switchBtn
    }()
    
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView() // 스택에 만든 프로퍼티(버튼이나 텍스트필드 등) 추가
        stack.spacing = 10 // 간격
        stack.axis = .vertical // 수평으로 할지 수직으로 할지
        stack.distribution = .fill // 분배
        stack.alignment = .fill //꽉채울지
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    @objc func onClickSwitch(sender: Any) {
        guard let todo else { return }
        if switchButton.isOn {
            textLabel?.text = nil
            textLabel?.attributedText = todo.content?.strikeThrough()
            TodoManager.completedTodo(todo: todo, isCompleted: true)
        } else {
            textLabel?.attributedText = nil
            textLabel?.text = todo.content
            TodoManager.completedTodo(todo: todo, isCompleted: false)
        }
    }
    
    func setTodo(_ _todo: Todo) {
        todo = _todo
        guard let todo else { return }
        if todo.isCompleted {
            textLabel?.text = nil
            textLabel?.attributedText = todo.content!.strikeThrough()
        } else {
            textLabel?.attributedText = nil
            textLabel?.text = todo.content
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
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    func switchViewMakeUI() {
        contentView.addSubview(switchButton)
        NSLayoutConstraint.activate([
            switchButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            switchButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

