//
//  ViewController.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 12/30/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var recommendButton: UIButton!
    
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendButton.backgroundColor = .yellow
        
        recommendButton.isUserInteractionEnabled = false
        resultLabel.isUserInteractionEnabled = true
        
        aboutOptional()
    }

    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        let text = wordTextField.text!.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if text.count == 0 {
            resultLabel.text = "검색어를 작성해주세요."
        } else if text == "jmt" {
            resultLabel.text = "존맛탱"
        } else {
            resultLabel.text = "\(text)로 입력했어요"
        }
    }
    
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        print(#function)
    }
    
    
    func aboutOptional() {
        var nickname: String? = "고래밥"
        nickname = nil
        var age: Int? = 20
        
        if nickname == nil {
            print("닉네임에 문제가 있어요")
        } else {
            print("\(nickname!)으로 설정합니다")
        }
        
        if let nickname {
            print("\(nickname)으로 설정합니다")
        } else {
            print("닉네임에 문제가 있어요")
        }
        
        if let age {
            print(age)
        } else {
            print("나이가 nil입니다")
        }
        
        guard let age else {
            print("옵셔널 해제를 실패했어요")
            return
        }
        print(age)
        
        print(nickname ?? "닉네임이 없어요")
        
        print(wordTextField.text?.count)
        if let text = wordTextField.text {
            print(text.count)
        }
    }
    
}

