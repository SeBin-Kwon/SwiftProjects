//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/3/25.
//

import UIKit

struct Friend {
    let name: String
    let message: String
    let profile_image: String
}

class UserTableViewController: UITableViewController {
    
    var friends = FriendsInfo().list
//    let friends = [
//        Friend(name: "칙촉", message: "행복한 하루", profile_image: "pencil"),
//        Friend(name: "고래밥", message: "고래밥 냠냠", profile_image: "star"),
//        Friend(name: "카스타드", message: "배고파", profile_image: "star.fill")
//    ]
//    
//    let name = ["고래밥", "칙촉", "카스타드"]
//    let message = ["고래밥 냠냠", "행복한 하루", "배고파"]
//    let profile = ["star", "pencil", "star.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "타이틀"
        let star = UIImage(systemName: "star")
        let right = UIBarButtonItem(image: star, style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        navigationItem.rightBarButtonItem = right
        
//        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
        
    }
    
    @objc
    func rightBarButtonItemTapped() {
        print(#function)
        // 1. 스토리보드 특정
//        let sb = UIStoryboard(name: "User", bundle: nil)
        
//        self.storyboard?.instantiateViewController(withIdentifier: "GrayViewController")
        
        
        // 2. 전환할 뷰컨트롤러를 가져오기
        let vc = storyboard?.instantiateViewController(withIdentifier: "GrayViewController") as! GrayViewController
        
        // 3. 화면을 전환할 방법 선택하기 - 우측에서 등장 / show / navigation / push
//        present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc
    func likeButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        friends[sender.tag].like.toggle()
//        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        print(friends[sender.tag].like)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UserTableViewCell 인스턴스
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        let row = friends[indexPath.row]
        
        cell.configureData(row: row)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        // 1. 스토리보드 특정
        let sb = UIStoryboard(name: "User", bundle: nil)
        
        // 2. 전환할 뷰컨트롤러를 가져오기
        // let vc = BrownViewController() 코드상에서만 가능함
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        
        // 값 전달 시 아웃렛 활용을 할 수 없음.(해당 코드가 실행되는 시점보다 아웃렛이 나중에 만들어진다.)
        // vc.testLabel.text = "고래밥"
        
        // 2. Pass Data - vc가 갖고 있는 프로퍼티에 데이터 추가
        vc.contents = friends[indexPath.row].name
        
        
        // 옵션 1
        // 아래에서 위로 뜰 때 방식
//        vc.modalPresentationStyle = .fullScreen
        // 전환 애니메이션
//        vc.modalTransitionStyle = .crossDissolve
        
        // 옵션 2
        // present 이지만 navigation title을 쓰고 싶다면, 다시 네비게이션 컨트롤러를 임베드 해서, 네비게이션 컨트롤러를 present
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        
        // 3. 화면을 전환할 방법 선택하기
        present(nav, animated: true)
//        navigationController?.pushViewController(vc, animated: true)
        tableView.reloadRows(at: [indexPath], with: .fade)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
