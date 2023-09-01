//
//  DetailView.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

class DetailView: UIView {
    
    // 멤버 데이터가 바뀌면
    var todo: Todo? {
        didSet {
            guard var todo = todo else {
                return
            }
            // 멤버가 있으면
            segmentedControl.selectedSegmentIndex = todo.category.toIndex()
            contentTextView.text = todo.content
        }
    }
    
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["none", "work", "life"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    var contentTextView: UITextView = {
        let content = UITextView()
        content.backgroundColor = .white
        content.text = "내용을 입력해주세요"
        content.layer.borderWidth = 1.0
        content.font = UIFont.systemFont(ofSize: 16)
        content.layer.borderColor = UIColor.systemOrange.cgColor
        content.layer.cornerRadius = 8
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [contentTextView, segmentedControl])
        stack.spacing = 30
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var stackViewTopConstraint: NSLayoutConstraint!
    
    override func updateConstraints() {
        stackViewMakeUI()
        super.updateConstraints()
    }
    
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(moveUpAction), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveDownAction), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentTextView.delegate = self
        setupNotification()
        stackViewMakeUI()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func stackViewMakeUI() {
        self.addSubview(stackView)
        
        stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40)
        
        NSLayoutConstraint.activate([
            contentTextView.heightAnchor.constraint(equalToConstant: 200),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackViewTopConstraint
        ])
        
    }
    
    @objc func moveUpAction() {
        stackViewTopConstraint.constant = 10
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func moveDownAction() {
        stackViewTopConstraint.constant = 40
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}


