//
//  UIViewController+Extension.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/14/25.
//

import UIKit

extension UIViewController {
    func displayAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}
