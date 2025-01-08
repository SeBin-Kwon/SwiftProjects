//
//  TenCollectionViewCell.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/7/25.
//

import UIKit

class TenCollectionViewCell: UICollectionViewCell {

    @IBOutlet var posterImageView: UIImageView!
        
    override func awakeFromNib() {
        
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        let date = format.string(from: Date())
        
        super.awakeFromNib()
        posterImageView.backgroundColor = .brown
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }

}
