//
//  CompletedTableViewConreoller + TableView.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/31.
//

import UIKit


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
