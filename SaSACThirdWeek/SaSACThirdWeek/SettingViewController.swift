//
//  SettingViewController.swift
//  SaSACThirdWeek
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

struct Setting {
    static let friendsLike = "star"
    static let productLike = "star"
    static let total = "전체 설정"
    static let personal = "개인 설정"
    static let others = "기타"
}


// 멤버와 값의 분리 -> rawValue
// CaseIterable -> case를 배열로 표현해줄 수 있음
enum SettingOptions: Int, CaseIterable {
    
    case total
    case personal
    case others
    
    var mainOption: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "고객센터"
        }
    }
    
    var subOption: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}


class SettingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let sectinonList: [SettingOptions] = SettingOptions.allCases
//    let rowList1 = ["공지사항", "실험실", "버전정보"]
//    let rowList2 = ["개인/보안", "알림", "채팅"]
//    let rowList3 = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(SettingOptions.allCases[0].subOption)
        print(SettingOptions.total.subOption[2])
        
        // 열거형의 멤버
        print(SettingOptions.personal)
        // 열거형에서 rawValue
        print(SettingOptions.personal.rawValue)
        print(Setting.personal)
        
        print(SettingOptions.allCases[1].rawValue)
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        SettingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        SettingOptions.allCases[section].mainOption
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingOptions.allCases[section].subOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOption[indexPath.row]
        return cell
    }
    
    
}
