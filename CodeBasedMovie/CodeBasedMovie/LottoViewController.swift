//
//  LottoViewController.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/14/25.
//

import UIKit
import Alamofire

class LottoViewController: UIViewController {
    
    let list = Array(1...1154)
    
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
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    let roundLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemYellow
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "당첨결과"
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    let uiView = UIView()
    
    let bonusLable: UILabel = {
        let label = UILabel()
        label.text = "보너스"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let ballStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        configureTextField()
        configureLabel()
        getLottoData("1154")
        configureBallStackView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureTapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        ballStackView.subviews.forEach {
            $0.layer.cornerRadius = ballStackView.frame.height / 2
            guard let label = $0 as? UILabel else { return }
            guard let text = label.text else { return }
            guard let num = Int(text) else { return }
            switch num {
            case 1...10:
                label.backgroundColor = .systemYellow
            case 11...20:
                label.backgroundColor = .systemBlue
            case 21...30:
                label.backgroundColor = .systemRed
            case 31...40:
                label.backgroundColor = .systemGray3
            default:
                label.backgroundColor = .systemGreen
            }
        }
    }
    
    @objc
    func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func configureBallUI() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        return label
    }
    
    func configureBallStackView() {
        view.addSubview(ballStackView)
        view.addSubview(bonusLable)
        for i in 0..<8 {
            if i == 6 {
                let plus: UILabel = {
                    let label = UILabel()
                    label.text = "+"
                    label.textAlignment = .center
                    label.font = .systemFont(ofSize: 15, weight: .bold)
                    return label
                }()
                ballStackView.addArrangedSubview(plus)
                continue
            }
            let ball = configureBallUI()
            ball.text = String(i)
            ball.snp.makeConstraints { make in
                make.size.equalTo(40)
            }
            ballStackView.addArrangedSubview(ball)
        }
        ballStackView.snp.makeConstraints { make in
            make.top.equalTo(uiView.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        bonusLable.snp.makeConstraints { make in
            make.top.equalTo(ballStackView.snp.bottom).offset(5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    func configureLabel() {
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(line)
        view.addSubview(uiView)
        uiView.addSubview(roundLabel)
        uiView.addSubview(resultLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        line.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(1)
        }
        uiView.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        roundLabel.snp.makeConstraints { make in
            make.trailing.equalTo(resultLabel.snp.leading).offset(-10)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(30)
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
    
    func getLottoData(_ num: String) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=" + num
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.dateLabel.text = value.drwNoDate + " 추첨"
                self.roundLabel.text = String(value.drwNo) + "회"
                let ballList = self.ballStackView.subviews as? [UILabel]
                guard let ballList else { return }
                ballList[0].text = String(value.drwtNo1)
                ballList[1].text = String(value.drwtNo2)
                ballList[2].text = String(value.drwtNo3)
                ballList[3].text = String(value.drwtNo4)
                ballList[4].text = String(value.drwtNo5)
                ballList[5].text = String(value.drwtNo6)
                ballList[7].text = String(value.bnusNo)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = String(list[row])
        getLottoData(String(list[row]))
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(list[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1154
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
}
