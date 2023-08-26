//
//  DetailViewController.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit

class DetailViewController: UIViewController {

    private let detailView =  DetailView()
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

    func navigationItemSetting() {
        
        self.title = "detail"
        
        let saveButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }

    @objc func saveButtonTapped() {
        
    }
}
