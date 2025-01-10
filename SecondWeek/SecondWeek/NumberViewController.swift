//
//  NumberViewController.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 12/30/24.
//

import UIKit
import Kingfisher

class NumberViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewBackground()
        
//        posterImageView.image = UIImage(named:"Image")
        if let url = URL(string: "https://img.wowtv.co.kr/wowtv_news/20160428/B20160428155346287.jpg") {
            posterImageView.kf.setImage(with: url)
        } else {
            posterImageView.image = UIImage(systemName: "star")
        }
        
        
        dateLabel.text = getToday()
//        getToday()
//        print(NSHomeDirectory())
        numberTextField.autocorrectionType = .no
        numberTextField.spellCheckingType = .no
        
        let result = UserDefaults.standard.string(forKey: "number")
        numberTextField.text = result
    }
    
    func randomInt() -> Int {
        return Int.random(in: 1...100)
    }
    
    
    @discardableResult
    func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        let today = format.string(from: Date())
        return today
    }

    @IBAction func textFieldTextChanged(_ sender: UITextField) {
        
//        if let number = Int(sender.text!) {
//            resultLabel.text = "\(number)"
//        } else {
//            resultLabel.text = "숫자가 아닙니다."
//        }
        
        guard let text = numberTextField.text else {
            print("옵셔널 오류")
            return
        }
        
//        if let number = Int(text) {
//            resultLabel.text = "\(number)"
//        } else {
//            resultLabel.text = "숫자가 아닙니다."
//        }
        
        guard let number = Int(text) else { resultLabel.text = "숫자가 아닙니다."
            return }
        resultLabel.text = "\(number)"
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // 텍스트필드에 적었던 내용을 영구적으로 저장.
        UserDefaults.standard.set(numberTextField.text, forKey: "number")
        print(#function)
        // 사용자에게 성공적으로 저장이 되었다는 알림을 주기
        // Alert
        // 1. 타이틀 + 메시지
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        // 2. 버튼
        let ok = UIAlertAction(title: "확인", style: .cancel)
        let test1 = UIAlertAction(title: "test1", style: .default)
        let test2 = UIAlertAction(title: "test2", style: .default)
        let test3 = UIAlertAction(title: "test3", style: .default)
        // 3. 본문에 버튼 추가: 순서대로 붙음
        alert.addAction(test3)
        alert.addAction(ok)
        alert.addAction(test2)
        alert.addAction(test1)
        // 4. 화면에 띄우기
        present(alert, animated: true)
    }
    
}
