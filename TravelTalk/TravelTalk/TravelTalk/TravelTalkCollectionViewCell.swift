//
//  CollectionViewCell.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

final class TravelTalkCollectionViewCell: UICollectionViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.layer.borderWidth = 0.5
        profileImageView.layer.borderColor = UIColor.systemGray4.cgColor
        nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        messageLabel.font = .systemFont(ofSize: 13, weight: .medium)
        messageLabel.textColor = .gray
        dateLabel.textAlignment = .right
        dateLabel.textColor = .systemGray2
    }
    
    func configureData(_ item: ChatRoom) {
        nameLabel.text = item.chatroomName
        guard let imageName = item.chatroomImage.first else { return }
        let image = UIImage(named: imageName)
        profileImageView.image = image
        
        guard let lastChat = item.chatList.last else { return }
        messageLabel.text = lastChat.message
        dateLabel.text = dateFormetted(lastChat.date)
    }

}
