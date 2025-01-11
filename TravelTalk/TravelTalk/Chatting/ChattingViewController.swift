//
//  ChattingViewController.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

class ChattingViewController: UIViewController {
    private let chattingId = ChattingTableViewCell.identifier
    private let myChattingId = MyChattingTableViewCell.identifier
    @IBOutlet var tableView: UITableView!
    var chatList: [Chat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: chattingId, bundle: nil)
        let myXib = UINib(nibName: myChattingId, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: chattingId)
        tableView.register(myXib, forCellReuseIdentifier: myChattingId)
        tableView.rowHeight = 120
    }

}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatList?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableCell = tableView.dequeueReusableCell(withIdentifier: chattingId, for: indexPath)
        guard let chat = chatList else { return tableCell }
        switch chat[indexPath.row].user {
        case .user:
            tableCell = tableView.dequeueReusableCell(withIdentifier: myChattingId, for: indexPath)
            guard let myCell = tableCell as? MyChattingTableViewCell else { return tableCell }
            myCell.configureData(chat[indexPath.row])
        default:
            guard let cell = tableCell as? ChattingTableViewCell else { return tableCell }
            cell.configureData(chat[indexPath.row])
        }
         
        return tableCell
    }
    
    
}
