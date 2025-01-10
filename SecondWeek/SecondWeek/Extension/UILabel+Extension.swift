//
//  UILabel+Extension.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/2/25.
//

import UIKit

extension UILabel {
    func setPrimaryLabel(_ text: String) {
        self.font = .boldSystemFont(ofSize: 20)
        self.textColor = .green
        self.textAlignment = .center
        self.text = text
    }
}
