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

extension TodoCompletedTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let detailVC = DetailViewController()

        let selectedTodo = TodoManager.filterCategory(category: TodoCategory.category(index: indexPath.section)!)[indexPath.row]
        
        detailVC.todo = selectedTodo
        
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TodoCompletedTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.filterIsCompleted().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        print(TodoManager.filterIsCompleted())
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCompletedCell", for: indexPath) as! CompletedTableViewCell
        cell.setTodo(TodoManager.filterIsCompleted()[indexPath.row])
        
        return cell
        
    }
}
