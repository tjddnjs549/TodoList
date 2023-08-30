//  TableViewController.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.

import UIKit

final class TodoTableViewController: UIViewController {

    private let tableView: UITableView = {
        let tbView = UITableView()
        tbView.translatesAutoresizingMaskIntoConstraints = false
        return tbView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        makeUI()
        navBarSetting()
        tableView.rowHeight = 70
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TodoCell")
    }
    
    // 델리게이트가 아닌 방식으로 구현할때는 화면 리프레시⭐️
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 뷰가 다시 나타날때, 테이블뷰를 리로드
        tableView.reloadData()
    }
    
    func navBarSetting() {
        self.title = "Table"
        
        let plusButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc func plusButtonTapped() {
        let defaultCategory = TodoCategory.none
        let alertController = UIAlertController(title: "할 일 추가",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "할 일을 입력하세요"
        }
        let addAction = UIAlertAction(title: "추가",
                                      style: .default) { [weak self] _ in
            guard let self else { return }
            if let title = alertController.textFields?.first?.text, !title.isEmpty {
                let newTodo = Todo(id: (TodoManager.getTodosList().last?.id ?? -1) + 1, category: defaultCategory,content: title ,isCompleted: false, date: Date())
                TodoManager.addTodoList(newTodo)
                self.tableView.insertRows(at: [IndexPath(row: TodoManager.filterCategory(category: defaultCategory).count-1, section: defaultCategory.toIndex())], with: .automatic)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    func makeUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }


}




