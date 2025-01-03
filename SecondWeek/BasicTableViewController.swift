//
//  BasicTableViewController.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/2/25.
//

import UIKit

class BasicTableViewController: UITableViewController {

    var list = ["프로젝트", "쇼핑", "메인 업무"] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var monster = Monster()
        
        
        tableView.rowHeight = 80
    }
    
    @IBAction func randomTextTapped(_ sender: UIBarButtonItem) {
        let random = ["장보기", "영화보기", "쇼핑하기", "맛집탐방", "새싹과제", "산책하기"]
        let value = random.randomElement() ?? "없음"
        list.append(value)
//        tableView.reloadData()
    }
    
    // 셀을 클릭했을 때
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        list.remove(at: indexPath.row)
//        tableView.reloadData()
    }
    
    // 1. 셀의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
    }
    
    // 2. 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sebinCell")!
        
        cell.textLabel?.text = list[indexPath.row]
//        cell.detailTextLabel?.text = "디테일 텍스트 레이블"
        
        cell.detailTextLabel?.setPrimaryLabel("test")
        cell.textLabel?.textColor = .blue
        cell.textLabel?.font = .systemFont(ofSize: 30)
        
        cell.backgroundColor = indexPath.row < 3 ? .gray : .white
//        if indexPath.row < 3 {
//            cell.backgroundColor = .gray
//        } else {
//            cell.backgroundColor = .none
//        }
        print(#function, indexPath)
        return cell
    }
    
    // 3. 셀의 높이
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print(#function, indexPath.row)
//        return 80
//    }
//    
    
    
}
