//
//  TodoCompletedTableViewController.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/31.
//

import UIKit

class TodoCompletedTableViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    var completedTodoList: [Todo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CompletedTableViewCell.self, forCellReuseIdentifier: "TodoCompletedCell")
        tableView.reloadData()
        navBarSetting()
        makeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    func navBarSetting() {
        self.title = "Complete"
    }
    
    func makeUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
