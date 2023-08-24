//
//  ViewController.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/23.

import UIKit

final class ViewController: UIViewController {

    private var checkToDoListButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true //둥글게
        button.layer.borderWidth = 3 //테두리 설정
        button.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.setTitle("할일 확인하기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private var successToDoListButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true //둥글게
        button.layer.borderWidth = 3 //테두리 설정
        button.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.setTitle("완료한일 보기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.addTarget(self, action: #selector(successButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var homeImage: UIImageView = {
        let image = UIImageView()
        let url = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg")
        image.load(url: url!)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [checkToDoListButton, successToDoListButton])
        stack.spacing = 10 // 간격
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        setupNaviBar()
    }

    private func setupNaviBar() {
        
        self.title = "Main"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
    }
    
    private func makeUI() {
        view.backgroundColor = .white
        
        view.addSubview(buttonStackView)
        view.addSubview(homeImage)
        
        NSLayoutConstraint.activate([
            homeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            homeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            homeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
            homeImage.heightAnchor.constraint(equalToConstant: 200),
            
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            buttonStackView.topAnchor.constraint(equalTo: homeImage.bottomAnchor, constant: 10),
            buttonStackView.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}



