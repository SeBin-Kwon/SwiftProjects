//
//  CollectionViewCell.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

class TravelTalkCollectionViewCell: UICollectionViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureData(_ item: ChatRoom) {
        
        nameLabel.text = item.chatroomName
        guard let imageName = item.chatroomImage.first else { return }
        let image = UIImage(named: imageName)
        profileImageView.image = image
        
        guard let lastChat = item.chatList.last else { return }
        messageLabel.text = lastChat.message
        dateLabel.text = lastChat.date
    }

}