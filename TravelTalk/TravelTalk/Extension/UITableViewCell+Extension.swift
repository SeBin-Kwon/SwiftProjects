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
        TravelTalkViewController.format.dateFormat = "yyyy-MM-dd HH:mm"
        let date = TravelTalkViewController.format.date(from: str)
        TravelTalkViewController.format.locale = Locale(identifier: "ko_KR")
        TravelTalkViewController.format.dateFormat = "hh:mm a"
        return TravelTalkViewController.format.string(from: date ?? Date())
    }
    
}
