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
    @IBOutlet var textView: UITextView!
    @IBOutlet var textViewBackground: UIView!
    @IBOutlet var chatButton: UIButton!
    let textViewPlaceHolder = "메시지를 입력하세요"
    var chatRoom: ChatRoom?
    private var chatList = [Chat]() {
        didSet {
            tableView.reloadData()
        }
    }
    private var endIndex: IndexPath {
        IndexPath(row: chatList.count - 1, section: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        textView.delegate = self
        confitureChatRoom()
        configureTableView()
        configureTextViewUI()
        configureChatButtonUI()
        setupKeyboardEvent()
    }
    
    @IBAction func chatButtonTapped(_ sender: UIButton) {
        guard let text = textView.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        guard !text.isEmpty else { return }
        let date = TravelTalkCollectionViewCell.format.string(from: Date())
        let message = Chat(user: .user, date: date, message: text)
        chatList.append(message)
        textView.text = ""
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.scrollToRow(at: endIndex, at: .bottom, animated: true)
        view.endEditing(true)
    }
    
    private func confitureChatRoom() {
        guard let chatRoom else { return }
        navigationItem.title = chatRoom.chatroomName
        chatList = chatRoom.chatList
    }
    
    private func configureChatButtonUI() {
        chatButton.tintColor = .gray
    }
}

// MARK: TextView
extension ChattingViewController: UITextViewDelegate {
    
    private func configureTextViewUI() {
        textView.backgroundColor = .clear
        textView.text = textViewPlaceHolder
        textView.textColor = .lightGray
        textViewBackground.backgroundColor = .systemGray6
        textViewBackground.layer.cornerRadius = 10
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }
}

// MARK: TableView
extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func configureTableView() {
        let xib = UINib(nibName: chattingId, bundle: nil)
        let myXib = UINib(nibName: myChattingId, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: chattingId)
        tableView.register(myXib, forCellReuseIdentifier: myChattingId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.scrollToRow(at: endIndex, at: .bottom, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableCell = tableView.dequeueReusableCell(withIdentifier: chattingId, for: indexPath)
        switch chatList[indexPath.row].user {
        case .user:
            tableCell = tableView.dequeueReusableCell(withIdentifier: myChattingId, for: indexPath)
            guard let myCell = tableCell as? MyChattingTableViewCell else { return tableCell }
            myCell.selectionStyle = .none
            myCell.configureData(chatList[indexPath.row])
        default:
            guard let cell = tableCell as? ChattingTableViewCell else { return tableCell }
            cell.selectionStyle = .none
            cell.configureData(chatList[indexPath.row])
        }
         
        return tableCell
    }
    
    
}
