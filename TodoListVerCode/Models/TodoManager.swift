//
//  TodoManager.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

final class TodoManager {
    
    private static let defaults = UserDefaults.standard
    
    static let key = "todoList"
    
    static func filterCategory(category: TodoCategory) -> [Todo] {
        return Self.getTodosList().filter { $0.category == category }
    }
    
    static func filterIsCompleted() -> [Todo] {
        return Self.getTodosList().filter { $0.isCompleted == true }
    }
    
    // 전체 리스트 얻기(Read)
    static func getTodosList() -> [Todo] {
        if let todoList = TodoManager.defaults.data(forKey: TodoManager.key),
           let todo = try? JSONDecoder().decode([Todo].self, from: todoList) {
            return todo
        }
        return []
    }
    
    //리스트 추가(create)
    static func addTodoList(_ todo: Todo) {
        var saveTodo = getTodosList()
        saveTodo.append(todo)
        saveTodosList(saveTodo)
    }
    
    //리스트 저장
    static func saveTodosList(_ todo: [Todo]) {
        if let todoList = try? JSONEncoder().encode(todo) {
            defaults.set(todoList, forKey: TodoManager.key)
        }
    }
    
    //리스트 삭제(delete)
    static func removeTodoList(_ todo: Todo) {
        var saveTodo = getTodosList()
        saveTodo.removeAll(where: {$0.date == todo.date})
        saveTodosList(saveTodo)
    }
    
    static func completedTodo(todo: Todo, isCompleted: Bool) {
        var saveTodo = getTodosList()
        for index in 0 ..< saveTodo.count {
            if saveTodo[index].id == todo.id {
                saveTodo[index].isCompleted = isCompleted
            }
        }
        saveTodosList(saveTodo)
    }
    
    static func editCategory(todo: Todo, category: TodoCategory) {
        var saveTodo = getTodosList()
        for index in 0 ..< saveTodo.count {
            if saveTodo[index].id == todo.id {
                saveTodo[index].category = category
            }
        }
        saveTodosList(saveTodo)
    }
    
    static func editContent(todo: Todo, content: String) {
        var saveTodo = getTodosList()
        for index in 0 ..< saveTodo.count {
            if saveTodo[index].id == todo.id {
                saveTodo[index].content = content
            }
        }
        saveTodosList(saveTodo)
    }
    
}


