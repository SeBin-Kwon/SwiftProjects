//
//  BookCollectionViewCell.swift
//  SeSACFourthWeek
//
//  Created by Sebin Kwon on 1/13/25.
//

import UIKit
import SnapKit

class BookCollectionViewCell: UICollectionViewCell {
    let bookCoverImageView = UIImageView()
    
    // viewDidload, awakeFromNib
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 별 다섯개: 셀에는 contentView가 존재! 여기에다가 뷰를 추가해주어야 액션이 동작함
        contentView.addSubview(bookCoverImageView)
        
        bookCoverImageView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        bookCoverImageView.backgroundColor = .brown
    }
    // 내일함
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
