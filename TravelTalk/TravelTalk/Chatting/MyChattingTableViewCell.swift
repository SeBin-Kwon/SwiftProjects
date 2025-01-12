//
//  MyChattingTableViewCell.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/11/25.
//

import UIKit

class MyChattingTableViewCell: UITableViewCell, ChattingProtocol {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageBackground: UIView!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        
    }
    
    func configureUI() {
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.numberOfLines = 0
        messageBackground.layer.borderWidth = 1
        messageBackground.layer.borderColor = UIColor.systemGray2.cgColor
        messageBackground.layer.cornerRadius = messageBackground.frame.height / 8
        messageBackground.backgroundColor = .systemGray6
        dateLabel.textAlignment = .right
        dateLabel.textColor = .systemGray
    }
    
    func configureData(_ item: Chat) {
        messageLabel.text = item.message
        dateLabel.text = dateFormetted(item.date)
    }
    
}
