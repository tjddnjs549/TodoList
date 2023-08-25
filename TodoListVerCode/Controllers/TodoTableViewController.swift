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
        
        //tableView.dataSource = self
        tableView.delegate = self
        
        makeUI()
        
        //tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }
    func navBarSetting() {
        self.title = "Table"
        
       //let updateButton = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(updateButtonTapped))
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

//extension TodoTableViewController: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//}

extension TodoTableViewController: UITableViewDelegate {
    
}
