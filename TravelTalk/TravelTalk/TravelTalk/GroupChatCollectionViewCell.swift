//
//  GroupChatCollectionViewCell.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/12/25.
//

import UIKit

final class GroupChatCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var groupImageList: [UIImageView]!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        messageLabel.font = .systemFont(ofSize: 13, weight: .medium)
        messageLabel.textColor = .gray
        dateLabel.textAlignment = .right
        dateLabel.textColor = .systemGray2
    }
    
    func configureData(_ item: ChatRoom) {
        nameLabel.text = item.chatroomName
        for i in 0..<item.chatroomImage.count {
            let image = UIImage(named: item.chatroomImage[i])
            groupImageList[i].image = image
            groupImageList[i].contentMode = .scaleAspectFill
            groupImageList[i].layer.cornerRadius = groupImageList[i].frame.height / 2
            groupImageList[i].layer.borderWidth = 0.5
            groupImageList[i].layer.borderColor = UIColor.systemGray4.cgColor
        }
        guard let lastChat = item.chatList.last else { return }
        messageLabel.text = lastChat.message
        dateLabel.text = dateFormetted(lastChat.date)
    }

}
