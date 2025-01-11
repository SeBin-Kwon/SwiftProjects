//
//  ChattingTableViewCell.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {
    
    @IBOutlet var chatProfileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
    }
    
    func configureData(_ item: Chat) {
        nameLabel.text = item.user.rawValue
        messageLabel.text = item.message
        dateLabel.text = item.date
        let image = UIImage(named: item.user.profileImage)
        chatProfileImage.image = image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
