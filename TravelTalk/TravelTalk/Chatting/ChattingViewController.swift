//
//  ChattingViewController.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

class ChattingViewController: UIViewController {
    private let id = ChattingTableViewCell.identifier
    @IBOutlet var tableView: UITableView!
    var chatList: [Chat]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: id)
        tableView.rowHeight = 120
    }

}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatList?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! ChattingTableViewCell
        guard let chat = chatList else { return cell }
        cell.configureData(chat[indexPath.row])
        return cell
    }
    
    
}
