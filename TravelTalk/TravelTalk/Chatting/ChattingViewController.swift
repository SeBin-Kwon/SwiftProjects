//
//  ChattingViewController.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

final class ChattingViewController: UIViewController {
    private let chattingId = ChattingTableViewCell.identifier
    private let myChattingId = MyChattingTableViewCell.identifier
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var textViewBackground: UIView!
    @IBOutlet var chatButton: UIButton!
    private let textViewPlaceHolder = "메시지를 입력하세요"
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
        let date = TravelTalkViewController.format.string(from: Date())
        let message = Chat(user: .user, date: date, message: text)
        chatList.append(message)
        textView.text = ""
        scrollTableView(animated: true)
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
    
    private func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ sender: Notification) {
        scrollTableView(animated: true)
    }
    
    private func scrollTableView(animated: Bool) {
        if !chatList.isEmpty {
            tableView.scrollToRow(at: endIndex, at: .bottom, animated: animated)
        }
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
    
    func textViewDidChange(_ textView: UITextView) {
        let standardHeight = getTextHeight(text: "TEXT")
        let height = getTextHeight(text: textView.text)
        let numberOfLines = Int(ceil(height / standardHeight))
        textView.isScrollEnabled = numberOfLines < 4 ? false : true
//        let textViewHeight = textViewBackground.bounds.height
//        let textViewWidth = textViewBackground.bounds.width
//        textViewBackground.bounds = CGRect(x: 0, y: 0, width: textViewWidth, height: textViewHeight * CGFloat(numberOfLines))
    }
    
    private func getTextHeight(text: String) -> CGFloat {
            let size = CGSize(width: textView.bounds.width, height: .greatestFiniteMagnitude)
            let font = UIFont.systemFont(ofSize: 14)
            let rect = text.boundingRect(
                with: size,
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                attributes: [.font: font],
                context: nil
            )

            return rect.height
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
        scrollTableView(animated: false)
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
