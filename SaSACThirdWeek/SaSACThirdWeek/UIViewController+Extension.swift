//
//  UIViewController+Extension.swift
//  SaSACThirdWeek
//
//  Created by Sebin Kwon on 1/9/25.
//

import UIKit

extension UIViewController  {
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 160)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }
}

//class MyCollectionViewController: UICollectionViewFlowLayout {
//
//}
