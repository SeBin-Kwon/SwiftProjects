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
        TravelTalkViewController.format.dateFormat = "yyyy-MM-dd hh:mm"
        let date = TravelTalkViewController.format.date(from: str)
        TravelTalkViewController.format.dateFormat = "yy.MM.dd"
        return TravelTalkViewController.format.string(from: date ?? Date())
    }
}

