//
//  ChattingTableViewCell.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

final class ChattingTableViewCell: UITableViewCell, ChattingProtocol {
    
    @IBOutlet var chatProfileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var messageBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        chatProfileImage.contentMode = .scaleAspectFill
        chatProfileImage.layer.cornerRadius = chatProfileImage.frame.height / 2
        chatProfileImage.layer.borderWidth = 0.5
        chatProfileImage.layer.borderColor = UIColor.systemGray4.cgColor
        nameLabel.font = .systemFont(ofSize: 15, weight: .medium)
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.numberOfLines = 0
        messageBackground.layer.borderWidth = 1
        messageBackground.layer.borderColor = UIColor.systemGray2.cgColor
        messageBackground.layer.cornerRadius = messageBackground.frame.height / 8
        dateLabel.textColor = .systemGray
    }
    
    func configureData(_ item: Chat) {
        nameLabel.text = item.user.rawValue
        messageLabel.text = item.message
        dateLabel.text = dateFormetted(item.date)
        let image = UIImage(named: item.user.profileImage)
        chatProfileImage.image = image
    }
    
    

}
