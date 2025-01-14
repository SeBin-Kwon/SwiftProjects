//
//  LottoViewController.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/14/25.
//

import UIKit

class LottoViewController: UIViewController {
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "로또 회차를 입력하세요"
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        return tf
    }()
    
    let pickerView = UIPickerView()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "당첨번호 안내"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        configureTextField()
        configureInfoLabel()
    }
    
    func configureInfoLabel() {
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    func configureTextField() {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    func getLottoData() {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1154"
        
    }


}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        <#code#>
//    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
}
