//
//  UITableViewCell+Extension.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
    
    func dateFormetted(_ str: String) -> String {
        TravelTalkCollectionViewCell.format.dateFormat = "yyyy-MM-dd HH:mm"
        let date = TravelTalkCollectionViewCell.format.date(from: str)
        TravelTalkCollectionViewCell.format.locale = Locale(identifier: "ko_KR")
        TravelTalkCollectionViewCell.format.dateFormat = "hh:mm a"
        return TravelTalkCollectionViewCell.format.string(from: date ?? Date())
    }
    
}
