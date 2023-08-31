//
//  TodoTableViewCon+TableView.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit


extension TodoTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        if isFiltering() {
            return filteredTodoList.count
        } else {
            if section == TodoCategory.none.toIndex() {
                return TodoManager.filterCategory(category: .none).count
            } else if section == TodoCategory.work.toIndex() {
                return TodoManager.filterCategory(category: .work).count
            } else if section == TodoCategory.life.toIndex() {
                return TodoManager.filterCategory(category: .life).count
            } else {
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        
        if isFiltering() {
            cell.contentLabel.text = filteredTodoList[indexPath.row].content
        } else {
            if indexPath.section == TodoCategory.none.toIndex() {
                cell.setTodo(TodoManager.filterCategory(category: .none)[indexPath.row])
            } else if indexPath.section == TodoCategory.work.toIndex() {
                cell.setTodo(TodoManager.filterCategory(category: .work)[indexPath.row])
            } else if indexPath.section == TodoCategory.life.toIndex() {
                cell.setTodo(TodoManager.filterCategory(category: .life)[indexPath.row])
            } else {
                return UITableViewCell()
            }
        }
        print(TodoManager.getTodosList())
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        if !isFiltering() {
            let label = UILabel(frame: CGRect(x: 8, y: 20, width: tableView.frame.size.width , height: 20))
            label.textColor = UIColor.systemOrange
            label.font = UIFont.boldSystemFont(ofSize: 12)
            label.textAlignment = .left
            label.text = "------------------------------------------------------------------"
            
            footerView.addSubview(label)
            return footerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if isFiltering() {
            return 0
        } else {
            let numberOfRows = tableView.numberOfRows(inSection: section)
            return numberOfRows == 0 ? 0 : 24
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return isFiltering() ? 1 : TodoCategory.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isFiltering() {
            return "검색 결과"
        }
        guard TodoManager.getTodosList().count != 0 else { return nil }
        guard let category = TodoCategory.category(index: section) else { return nil }
        let title = category.rawValue
        return TodoManager.filterCategory(category: category).isEmpty ? nil : title
    }
}

extension TodoTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        let detailVC = DetailViewController()
        
        let selectedTodo = isFiltering() ? filteredTodoList[indexPath.row] : TodoManager.filterCategory(category: TodoCategory.category(index: indexPath.section)!)[indexPath.row]
        
        detailVC.todo = selectedTodo
        print(selectedTodo)
        
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        var row = TodoManager.getTodosList()[indexPath.row]
        if indexPath.section == 0 {
            row = TodoManager.filterCategory(category: TodoCategory.category(index: 0)!)[indexPath.row]
        } else if indexPath.section == 1 {
            row = TodoManager.filterCategory(category: TodoCategory.category(index: 1)!)[indexPath.row]
        } else if indexPath.section == 2 {
            row = TodoManager.filterCategory(category: TodoCategory.category(index: 2)!)[indexPath.row]
        } else if isFiltering() {
            row = TodoManager.filterCategory(category: TodoCategory.category(index: indexPath.section)!)[indexPath.row]
        }
        
        let alert = UIAlertController(title: nil, message: "메모를 삭제해도 되나요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { (action) in
            if self.isFiltering() {
                self.filteredTodoList.remove(at: indexPath.row)
            }
            TodoManager.removeTodoList(row)
            tableView.reloadData()
        }
        let noAction = UIAlertAction(title: "아니오", style: .cancel) { (action) in
            return
        }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
}


extension TodoTableViewController: UISearchBarDelegate, UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        
        if !isFiltering() {
            filteredTodoList = TodoManager.getTodosList()
        } else {
          
            filteredTodoList = TodoManager.getTodosList().filter { $0.content!.lowercased().contains(searchText)}.sorted {$0.date < $1.date}
        }
        tableView.reloadData()
        print(filteredTodoList)
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
   
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        updateSearchResults(for: searchController)
    }
}
