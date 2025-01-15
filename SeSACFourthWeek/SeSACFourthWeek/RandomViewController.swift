//
//  RandomViewController.swift
//  SeSACFourthWeek
//
//  Created by Sebin Kwon on 1/14/25.
//

import UIKit
import SnapKit
import Alamofire

struct User: Decodable {
    let results: [UserDetail]
}

struct UserDetail: Decodable {
    let gender: String
    let email: String
    let name: UserName
}

struct UserName: Decodable {
    let first: String
    let last : String
}

struct Lotto: Decodable {
    let drwNoDate: String
    let firstWinamnt: Int
}


struct Dog: Decodable {
    let message: String
    let status: String
}

protocol ViewConfiguration: AnyObject {
    func configureHierarchy() // addSubView
    func configureLayout() // snapKit
    func configureView() // property
}

class RandomViewController: UIViewController, ViewConfiguration {
    
    let dogImageView = UIImageView()
    let nameLabel = UILabel()
    let randomButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        view.addSubview(dogImageView)
        view.addSubview(nameLabel)
        view.addSubview(randomButton)
    }
    
    func configureLayout() {
        dogImageView.snp.makeConstraints { make in
            make.size.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(dogImageView.snp.bottom).offset(20)
        }
        randomButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
    }
    
    func configureView() {
        dogImageView.backgroundColor = .brown
        nameLabel.backgroundColor = .systemGreen
        randomButton.backgroundColor = .brown
        randomButton.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
    }
    
    // 1 4 2 3 순인 이유?
    // 버튼 누르는데 10초 걸린다면? 사용자는 매우 답답할 것
    //
    
    @objc
    func randomButtonTapped() {
        print("========11111111========")
        // 버튼 누르면 랜덤으로 강아지 나오게
        // 크롬에서 엔터키 눌렀을 때,
        let url = "https://dog.ceo/api/breeds/image/random"
        
        AF.request(url, method: .get).responseString { response in
            print(response)
        }
        // responseDecodable: 응답이 잘못된것도 실패고 식판에 안담겨도 실패
        // responseString: 식판이랑 상관없이 응답이 잘 왔는 지 확인!
        AF.request(url, method: .get).responseDecodable(of: Dog.self) { response in
            print("========222222222========")
            switch response.result {
            case .success(let value):
                print("success")
                self.nameLabel.text = value.message
            case .failure(let error):
                print("error")
                print(error)
            }
            print("========3333333333========")
        }
        print("========44444444444========")
    }
    
    
    @objc
    func lottoButtonTapped() {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(Int.random(in: 800...1154))"
        
        AF.request(url, method: .get).responseString { value in
            print(value)
        }
        
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
            print("========222222222========")
            switch response.result {
            case .success(let value):
                print("success")
                self.nameLabel.text = value.drwNoDate + value.firstWinamnt.formatted()
            case .failure(let error):
                print("error")
                print(error)
            }
            print("========3333333333========")
        }
    }
    
    @objc
    func userButtonTapped() {
        let url = "https://randomuser.me/api/?results=10"
        
        AF.request(url, method: .get).responseDecodable(of: User.self) { response in
            print("========222222222========")
            switch response.result {
            case .success(let value):
                print("success")
                self.nameLabel.text = value.results[0].name.first
            case .failure(let error):
                print("error")
                print(error)
            }
            print("========3333333333========")
        }
    }
}
