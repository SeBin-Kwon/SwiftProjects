//
//  MyChattingTableViewCell.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/11/25.
//

import UIKit

class MyChattingTableViewCell: UITableViewCell {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        
    }
    
    private func configureUI() {
        messageLabel.numberOfLines = 0
    }
    
    func configureData(_ item: Chat) {
        messageLabel.text = item.message
        dateLabel.text = item.date
    }
    
}
