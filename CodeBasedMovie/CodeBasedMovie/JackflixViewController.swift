//
//  JackflixViewController.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/13/25.
//

import UIKit

final class JackflixViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "JACKPLAX"
        label.textColor = .red
        label.font = .systemFont(ofSize: 30, weight: .black)
        return label
    }()
    private var textFieldList = [UITextField]()
    private let placeholderList = ["이메일 주소 또는 전화번호", "비밀번호", "닉네임", "위치", "추천 코드 입력"]
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    private let infoSwitch: UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.isOn = true
        switchBtn.onTintColor = .red
        return switchBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureTitleLabel()
        configureTextField()
        configureSingUpButton()
        configureInfoSwitch()
        configureInfoLabel()
    }
    
    private func configureInfoSwitch() {
        view.addSubview(infoSwitch)
        infoSwitch.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
    }
    
    private func configureInfoLabel() {
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(infoSwitch)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
    }
    
    private func configureSingUpButton() {
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldList[textFieldList.count-1].snp.bottom).offset(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(50)
        }
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(80)
        }
    }
    
    private func configureTextField() {
        for i in 0..<placeholderList.count {
            textFieldList.append(UITextField())
            view.addSubview(textFieldList[i])
            if i == 0 {
                textFieldList[i].snp.makeConstraints { make in
                    make.top.equalTo(titleLabel.snp.bottom).offset(110)
                    make.centerX.equalTo(view.safeAreaLayoutGuide)
                    make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
                    make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
                    make.height.equalTo(40)
                }
            } else {
                textFieldList[i].snp.makeConstraints { make in
                    make.top.equalTo(textFieldList[i-1].snp.bottom).offset(20)
                    make.centerX.equalTo(view.safeAreaLayoutGuide)
                    make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
                    make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
                    make.height.equalTo(40)
                }
            }
            textFieldList[i].textColor = .white
            textFieldList[i].textAlignment = .center
            textFieldList[i].backgroundColor = .darkGray
            textFieldList[i].attributedPlaceholder = NSAttributedString(string: placeholderList[i], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
            textFieldList[i].borderStyle = .roundedRect
        }
    }
    
}
