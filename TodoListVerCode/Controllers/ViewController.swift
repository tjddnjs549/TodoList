//
//  ViewController.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/23.

import UIKit

final class ViewController: UIViewController {
    
    
    static let urlString = "https://spartacodingclub.kr/css/images/scc-og.jpg"
    
    private var checkToDoListButton: UIButton = {
        let checkBtn = UIButton(type: .custom)
        checkBtn.backgroundColor = .clear
        checkBtn.layer.cornerRadius = 5
        checkBtn.clipsToBounds = true //둥글게
        checkBtn.layer.borderWidth = 2 //테두리 설정
        checkBtn.layer.borderColor =  CGColor(red: 0.98, green: 0.52, blue: 0.00, alpha: 1.00)
        checkBtn.setTitle("할 일 확인하기", for: .normal)
        checkBtn.setTitleColor(.systemOrange, for: .normal)
        checkBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        checkBtn.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        checkBtn.translatesAutoresizingMaskIntoConstraints = false
        return checkBtn
    }()
    
    
    private var successToDoListButton: UIButton = {
        let successBtn = UIButton(type: .custom)
        successBtn.backgroundColor = .clear
        successBtn.layer.cornerRadius = 5
        successBtn.clipsToBounds = true //둥글게
        successBtn.layer.borderWidth = 2 //테두리 설정
        successBtn.layer.borderColor = CGColor(red: 0.98, green: 0.52, blue: 0.00, alpha: 1.00)
        successBtn.setTitle("완료한 일 보기", for: .normal)
        successBtn.setTitleColor(.systemOrange, for: .normal)
        successBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        successBtn.addTarget(self, action: #selector(successButtonTapped), for: .touchUpInside)
        successBtn.translatesAutoresizingMaskIntoConstraints = false
        return successBtn
    }()
    
    lazy var homeImage: UIImageView = {
        let image = UIImageView()
        let url = URL(string: Self.urlString)
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
    }
    
    @objc func checkButtonTapped() {
        let TodoListPage = TodoTableViewController()
        self.navigationController?.pushViewController(TodoListPage, animated: true)
    }
    
    @objc func successButtonTapped() {
        let TodoCompletedPage = TodoCompletedTableViewController()
        self.navigationController?.pushViewController(TodoCompletedPage, animated: true)
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



