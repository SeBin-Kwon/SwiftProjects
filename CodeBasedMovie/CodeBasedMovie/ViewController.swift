//
//  ViewController.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/13/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var fourthButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstButton.setTitle("잭플릭스", for: .normal)
        secondButton.setTitle("네이버페이", for: .normal)
        thirdButton.setTitle("영화검색창", for: .normal)
        fourthButton.setTitle("로또", for: .normal)
    }
    
    @IBAction func firstButtonTapped(_ sender: UIButton) {
        let vc = JackflixViewController()
        present(vc, animated: true)
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        let vc =  NaverPayViewController()
        present(vc, animated: true)
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        let vc = SearchMovieViewController()
        present(vc, animated: true)
    }
    
    @IBAction func fourthButtonTapped(_ sender: UIButton) {
        let vc = LottoViewController()
        present(vc, animated: true)

    }
    
    
}

