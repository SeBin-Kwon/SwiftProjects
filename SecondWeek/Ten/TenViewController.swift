//
//  TenViewController.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/7/25.
//

import UIKit

// 왜 여기서는 cellforrowat 안나올까?
// 테이블뷰를 만들 때 필요한 것들이 있는거 같은데, 이거 수동으로 다 해줘야함
class TenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
        tableView.rowHeight = 80
        // 테이블뷰와 부하직원을 서로 연결
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell", for: indexPath) as! NoProfileTableViewCell
        print(#function)
        cell.backgroundColor = .lightGray
        return cell
    }
    
}
