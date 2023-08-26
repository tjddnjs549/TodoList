//
//  DetailView.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

class DetailView: UIView {

    private var keywordTextField: UITextField = {
        let keyword = UITextField()
        keyword.backgroundColor = .white
        keyword.placeholder = "키워드를 입력해주세요"
        keyword.keyboardType = .emailAddress
        keyword.font = UIFont.systemFont(ofSize: 18)
        keyword.autocapitalizationType = .none // 자동으로 맨 앞을 대문자로 할건지
        keyword.autocorrectionType = .no // 틀린글자 있을 때 자동으로 잡아줄지
        keyword.spellCheckingType = .no //스펠링 체크
        keyword.translatesAutoresizingMaskIntoConstraints = false
        keyword.layer.cornerRadius = 12
        keyword.clipsToBounds = true
        keyword.layer.borderWidth = 2.0
        keyword.layer.borderColor = UIColor.black.cgColor
        return keyword
    }()
    
    private let contentTextView: UITextView = {
        let content = UITextView()
        content.text = "내용을 입력해주세요"
        content.layer.borderWidth = 1.0
        content.layer.borderColor = UIColor.lightGray.cgColor
        content.layer.cornerRadius = 12
        return content
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [keywordTextField, contentTextView])
        stack.spacing = 15
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        
        return stack
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentTextView.delegate = self
        keywordTextField.delegate = self
        
        
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func stackViewMakeUI() {
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
        ])
        
    }
}


