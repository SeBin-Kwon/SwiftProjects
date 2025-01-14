//
//  SearchMovieViewController.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/13/25.
//

import UIKit
import Alamofire

class SearchMovieViewController: UIViewController {
    
    var movieList = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }

    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        return table
    }()
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "film")
        image.contentMode = .scaleAspectFill
        return image
    }()
    let backgroundUIView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        return view
    }()
    
    let textField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = UIColor.white
        textfield.placeholder = "yyyyMMdd 형식으로 검색해 주세요"
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    lazy var searchStackView = {
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
        getMovieData()
        configureBackground()
        configureSearchStackView()
        configureSearchButton()
        configureTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 45
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)   
    }
    
    func getMovieData() {
        let key = "bd6fe79987b8d185c867e059343572fa"
        let date = "20250113"
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(key)&targetDt=\(date)"
        
        AF.request(url, method: .get).responseDecodable(of: MovieResult.self) { response in
            switch response.result {
            case .success(let value):
                value.boxOfficeResult.dailyBoxOfficeList.forEach {
                    self.movieList.append($0)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textField.frame.size.height-1, width: textField.frame.width, height: 3)
        border.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(border)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchStackView.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.bottom.equalTo(-180)
        }
    }
    
    func configureSearchButton() {
        searchButton.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
    }
    
    func configureSearchStackView() {
        view.addSubview(searchStackView)
        searchStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.height.equalTo(50)
        }
    }
    
    func configureBackground() {
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
