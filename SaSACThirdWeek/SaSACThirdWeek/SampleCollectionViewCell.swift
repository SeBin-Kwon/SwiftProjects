//
//  SampleCollectionViewCell.swift
//  SaSACThirdWeek
//
//  Created by Sebin Kwon on 1/9/25.
//

import UIKit

class SampleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SampleCollectionViewCell"
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
        
    }

}
