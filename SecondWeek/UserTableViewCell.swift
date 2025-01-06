//
//  UserTableViewCell.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/3/25.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"
    
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet private var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        configure()
    }
    
    override func prepareForReuse() {
        print(#function)
        profileImageView.image = UIImage(systemName: "person")
    }
    
    private func configure() {
        profileImageView.backgroundColor = .brown
        nameLabel.font = .boldSystemFont(ofSize: 30)
        messageLabel.font = .systemFont(ofSize: 20)
        messageLabel.numberOfLines = 0
    }
    
    func configureData(row: Friends) {
        print(#function)
        nameLabel.text = row.nameDescription
        messageLabel.text = row.message
        
        let image = row.profile_image
        if let image {
            let url = URL(string: image)
            profileImageView.kf.setImage(with: url)
        } else {
            profileImageView.image = UIImage(systemName: "person")
        }
        
        let name = row.like ? "heart.fill" : "heart"
        let btn = UIImage(systemName: name)
        likeButton.setImage(btn, for: .normal)
    }
}
