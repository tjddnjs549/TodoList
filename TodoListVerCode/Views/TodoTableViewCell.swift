//
//  TodoTableViewCell.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

final class TodoTableViewCell: UITableViewCell {
    
    private let contentLabel: UILabel = {
        let ctn = UILabel()
        ctn.textColor = .systemOrange
        ctn.font = UIFont.boldSystemFont(ofSize: 16)
        //ctn.translatesAutoresizingMaskIntoConstraints = false
        return ctn
    }()
    
    private let dateLabel: UILabel = {
        let date = UILabel()
        date.textColor = .systemOrange
        date.font = UIFont.systemFont(ofSize: 14)
        //date.translatesAutoresizingMaskIntoConstraints = false
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
        let stack = UIStackView(arrangedSubviews: [contentLabel, dateLabel]) // 스택에 만든 프로퍼티(버튼이나 텍스트필드 등) 추가
        stack.spacing = 16 // 간격
        stack.axis = .vertical // 수평으로 할지 수직으로 할지
        stack.distribution = .fillEqually // 분배
        stack.alignment = .fill //꽉채울지
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        makeUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI() {
        stackViewMakeUI()
        switchViewMakeUI()
        
    }
    
    func stackViewMakeUI() {
        self.contentView.addSubview(contentLabel)
        
        stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive = true
    }
    
    func switchViewMakeUI() {
        self.contentView.addSubview(switchButton)
        
        NSLayoutConstraint.activate([
            switchButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10),
            switchButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            switchButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10),
            switchButton.widthAnchor.constraint(equalToConstant: 40)
        ])
      
        
        
        
    }
  
    @objc func onClickSwitch(sender: UISwitch) {
        let alert = UIAlertController(title: "완료 메세지", message: "이 일을 완료하셨습니까?", preferredStyle: .alert)
        // UIAlertController를 통해 alert 창을 만듬/ preferredStyle: alert창이 어떻게 나오는지 설정
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인 버튼이 눌렀습니다.")
            self.switchButton.isOn = true
            self.contentLabel.attributedText = self.contentLabel.text?.strikeThrough()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소 버튼이 눌렀습니다.")
        }
        alert.addAction(success) //addSubview랑 같은 것
        alert.addAction(cancel)
        //present(alert, animated: true, completion: nil) // 보여지게 함
    }
    
    
}

