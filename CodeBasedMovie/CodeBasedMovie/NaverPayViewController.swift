//
//  NaverPayViewController.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/13/25.
//

import UIKit
import SnapKit

class NaverPayViewController: UIViewController {
    
    lazy var segment = configureSegmentUI()
    let backgroundUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    let mainImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lock")
        image.contentMode = .scaleAspectFit
        return image
    }()
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    let domesticLabel: UILabel = {
        let label = UILabel()
        label.text = "국내 ▼"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    let closeButton: UIButton = {
        let xButton = UIButton()
        xButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        xButton.tintColor = .black
        return xButton
    }()
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "한 번만 인증하고\n비밀번호 없이 결제하세요"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .darkGray
        return label
    }()
    let checkButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(" 바로결제 사용하기", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        btn.tintColor = UIColor.greenColor1
        btn.setTitleColor(.darkGray, for: .normal)
        return btn
    }()
    let okButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("확인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.greenColor1
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.naverBackground
        configureSegment()
        configureBackgroundUIView()
        configureLogoImageView()
        configureMainImageView()
        configureMainLabel()
        configureDomesticLabel()
        configureCloseButton()
        configureOkButton()
        configureCheckButton()
    }
    
    func configureOkButton() {
        backgroundUIView.addSubview(okButton)
        okButton.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundUIView).inset(20)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    func configureCheckButton() {
        backgroundUIView.addSubview(checkButton)
        checkButton.snp.makeConstraints { make in
            make.bottom.equalTo(okButton.snp.top).offset(-30)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureMainLabel() {
        backgroundUIView.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureCloseButton() {
        backgroundUIView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView)
            make.trailing.equalTo(backgroundUIView).inset(20)
        }
    }
    
    func configureDomesticLabel() {
        backgroundUIView.addSubview(domesticLabel)
        domesticLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView)
            make.leading.equalTo(logoImageView.snp.trailing).offset(8)
        }
    }
    
    func configureLogoImageView() {
        backgroundUIView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(backgroundUIView).inset(-20)
            make.leading.equalTo(backgroundUIView).inset(20)
            make.width.equalTo(70)
        }
    }
    
    func configureMainImageView() {
        backgroundUIView.addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundUIView)
            make.top.equalTo(80)
            make.width.equalTo(140)
            make.height.equalTo(140)
        }
    }
    
    func configureBackgroundUIView() {
        view.addSubview(backgroundUIView)
        backgroundUIView.snp.makeConstraints { make in
            make.top.equalTo(segment.snp.bottom).offset(18)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(450)
        }
        
    }
    
    func configureSegment() {
        view.addSubview(segment)
        segment.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(40)
        }
    }
    
    func configureSegmentUI() -> UISegmentedControl {
        let seg = UISegmentedControl()
        seg.insertSegment(withTitle: "멤버십", at: 0, animated: true)
        seg.insertSegment(withTitle: "현장결제", at: 1, animated: true)
        seg.insertSegment(withTitle: "쿠폰", at: 2, animated: true)
        seg.backgroundColor = .black
        seg.selectedSegmentTintColor = UIColor.darkGray
        seg.setTitleTextAttributes([.foregroundColor : UIColor.white, .font: UIFont.systemFont(ofSize: 17, weight: .bold)], for: .selected)
        seg.setTitleTextAttributes([.foregroundColor : UIColor.gray,.font: UIFont.systemFont(ofSize: 17, weight: .bold)], for: .normal)
        seg.setDividerImage(nil, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        seg.selectedSegmentIndex = 1
        seg.layer.cornerRadius = seg.bounds.height / 2
        seg.layer.masksToBounds = true
        return seg
    }

}
