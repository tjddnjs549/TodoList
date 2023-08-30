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
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       print(#function)
       // (힙에 올라간)재사용 가능한 셀을 꺼내서 사용하는 메서드 (애플이 미리 잘 만들어 놓음)
       // (사전에 셀을 등록하는 과정이 내부 메커니즘에 존재)
       let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
       
       if indexPath.section == TodoCategory.none.toIndex() {
           cell.setTodo(TodoManager.filterCategory(category: .none)[indexPath.row])
       } else if indexPath.section == TodoCategory.work.toIndex() {
           cell.setTodo(TodoManager.filterCategory(category: .work)[indexPath.row])
       } else if indexPath.section == TodoCategory.life.toIndex() {
           cell.setTodo(TodoManager.filterCategory(category: .life)[indexPath.row])
       } else {
           return UITableViewCell()
       }
       return cell
       
//       셀에다가 멤버를 전달 (멤버만 전달하면, 화면에 표시하도록 구현⭐️ 셀에서 didSet으로)
//       cell.todo = todoManager.getTodosList()[indexPath.row]
//       cell.selectionStyle = .none
//       print(todoManager.getTodosList())
//       return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return TodoCategory.allCases.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard TodoManager.getTodosList().count != 0 else { return nil }
        guard let category = TodoCategory.category(index: section) else { return nil }
        let title = category.rawValue
        return TodoManager.filterCategory(category: category).isEmpty ? nil : title
    }
}

extension TodoTableViewController: UITableViewDelegate {
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        // 다음화면으로 이동
        let detailVC = DetailViewController()
        let selectedTodo = TodoManager.getTodosList()[indexPath.row]
        // 다음 화면에 멤버를 전달
       
        detailVC.todo = selectedTodo
        
        // 화면이동
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
