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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = UITableViewCell.
    }
}

extension TodoTableViewController: UITableViewDelegate {
    
}
