//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/3/25.
//

import UIKit
import Kingfisher

struct Friend {
    let name: String
    let message: String
    let profile_image: String
}

class UserTableViewController: UITableViewController {
    
    let friends = FriendsInfo().list
//    let friends = [
//        Friend(name: "칙촉", message: "행복한 하루", profile_image: "pencil"),
//        Friend(name: "고래밥", message: "고래밥 냠냠", profile_image: "star"),
//        Friend(name: "카스타드", message: "배고파", profile_image: "star.fill")
//    ]
//    
//    let name = ["고래밥", "칙촉", "카스타드"]
//    let message = ["고래밥 냠냠", "행복한 하루", "배고파"]
//    let profile = ["star", "pencil", "star.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let row = friends[indexPath.row]
        
        
        let name = row.like ? "heart.fill" : "heart"
        let btn = UIImage(systemName: name)
        cell.likeButton.setImage(btn, for: .normal)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
        
        cell.profileImageView.backgroundColor = .brown
        
        cell.nameLabel.text = row.name
        cell.messageLabel.text = row.message
        let image = row.profile_image
        if let image {
            let url = URL(string: image)
            cell.profileImageView.kf.setImage(with: url)
        } else {
            cell.profileImageView.image = UIImage(systemName: "person")
        }
        cell.nameLabel.font = .boldSystemFont(ofSize: 30)
        cell.messageLabel.font = .systemFont(ofSize: 20)
        
//        cell.likeButton.setImage(UIImage(systemName: name), for: .normal)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
