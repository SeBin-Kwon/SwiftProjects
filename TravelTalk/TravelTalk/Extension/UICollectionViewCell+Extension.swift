//
//  UICollectionViewCell+Extension.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
    
    func dateFormetted(_ str: String) -> String {
        TravelTalkCollectionViewCell.format.dateFormat = "yyyy-MM-dd hh:mm"
        let date = TravelTalkCollectionViewCell.format.date(from: str)
        TravelTalkCollectionViewCell.format.dateFormat = "yy.MM.dd"
        return TravelTalkCollectionViewCell.format.string(from: date ?? Date())
    }
}

