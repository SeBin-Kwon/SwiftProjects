//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/3/25.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    let name = ["고래밥", "칙촉", "카스타드"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        name.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        cell.profileImageView.backgroundColor = .brown
        cell.nameLabel.text = name[indexPath.row]
        cell.messageLabel.text = "상태 메시지"
        cell.nameLabel.font = .boldSystemFont(ofSize: 30)
        cell.messageLabel.font = .systemFont(ofSize: 20)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
