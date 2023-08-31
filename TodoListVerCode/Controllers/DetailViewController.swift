//
//  DetailViewController.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var todo: Todo?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSetting()
        setupData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let todo, let content = detailView.contentTextView.text, let category = TodoCategory.category(index: detailView.segmentedControl.selectedSegmentIndex) else {return}
        
        TodoManager.editCategory(todo: todo, category: category)
        TodoManager.editContent(todo: todo, content: content)
        print(TodoManager.getTodosList())
    }
    
    // 리스트를 뷰에 전달
    private func setupData() {
        detailView.todo = todo
        detailView.segmentedControl.removeAllSegments()
        for (index, category) in TodoCategory.allCases.enumerated() {
            detailView.segmentedControl.insertSegment(withTitle: category.rawValue, at: index, animated: false)
        }
        detailView.segmentedControl.selectedSegmentIndex = todo?.category.toIndex() ?? 0
    }
    
    func navigationItemSetting() {
        if todo == nil {
            self.title = "추가"
        } else {
            self.title = "수정"
        }
        
        let saveButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveButtonTapped() {
        guard let todo, let content = detailView.contentTextView.text, let category = TodoCategory.category(index: detailView.segmentedControl.selectedSegmentIndex) else {return}
        
        TodoManager.editCategory(todo: todo, category: category)
        TodoManager.editContent(todo: todo, content: content)
        print("수정 완료")
        self.navigationController?.popViewController(animated: true)
        print(TodoManager.getTodosList())
    }
}

