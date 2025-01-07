//
//  GrayViewController.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/7/25.
//

import UIKit

class GrayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        print(#function)
        dismiss(animated: true)
    }
    
    
}
