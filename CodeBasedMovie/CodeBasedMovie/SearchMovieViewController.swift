//
//  SearchMovieViewController.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/13/25.
//

import UIKit
import Alamofire

final class SearchMovieViewController: UIViewController {
    
    private let format = DateFormatter()
    
    private var movieList = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        return table
    }()
    
    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "film")
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let backgroundUIView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        return view
    }()
    
    private let textField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = UIColor.white
        textfield.attributedPlaceholder = NSAttributedString(string: "yyyyMMdd 형식으로 검색해 주세요", attributes: [.foregroundColor: UIColor.gray])
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private lazy var searchStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(searchButton)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieData(setYesterday())
        configureBackground()
        configureSearchStackView()
        configureSearchButton()
        configureTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 45
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    private func getMovieData(_ date: String) {
        let key = "bd6fe79987b8d185c867e059343572fa"
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(key)&targetDt=\(date)"
        
        AF.request(url, method: .get).responseDecodable(of: MovieResult.self) { response in
            switch response.result {
            case .success(let value):
                self.movieList = []
                value.boxOfficeResult.dailyBoxOfficeList.forEach {
                    self.movieList.append($0)
                }
                
            case .failure(let error):
                self.displayAlert("yyyyMMdd 형식을 지켜서 검색해 주세요")
                print(error)
            }
        }
        
    }
    
    private func setYesterday() -> String {
        format.dateFormat = "yyyyMMdd"
        return format.string(from: Date() - 86400)
    }
    
    @objc
    private func searchDailyMovieRank() {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        guard let date = format.date(from: text) else {
            displayAlert("잘못된 날짜입니다.")
            return
        }
        
        if date > Date() || date < Date.distantPast {
            displayAlert("날짜를 다시 확인해 주세요")
        }
        
        getMovieData(text)
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textField.frame.size.height-1, width: textField.frame.width, height: 3)
        border.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(border)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchStackView.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.bottom.equalTo(-180)
        }
    }
    
    private func configureSearchButton() {
        searchButton.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        searchButton.addTarget(self, action: #selector(searchDailyMovieRank), for: .touchUpInside)
    }
    
    private func configureSearchStackView() {
        view.addSubview(searchStackView)
        searchStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.height.equalTo(50)
        }
    }
    
    private func configureBackground() {
        view.addSubview(backgroundImageView)
        view.addSubview(backgroundUIView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundUIView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SearchMovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath)
        guard let cell = tableCell as? MovieTableViewCell else { return tableCell }
        cell.backgroundColor = .clear
        cell.configureData(movieList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
}
