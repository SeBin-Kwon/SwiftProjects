//
//  SearchMovieViewController.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/13/25.
//

import UIKit

class SearchMovieViewController: UIViewController {
    
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
    
    lazy var cellStackView = configureCellStackViewUI()
    
    lazy var tableStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        configureSearchStackView()
        configureSearchButton()
        configureTableStack()
        configureLabelData()
    }
    
    override func viewDidLayoutSubviews() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textField.frame.size.height-1, width: textField.frame.width, height: 3)
        border.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(border)
    }
    
    func configureLabelData() {
        movieList.forEach { movie in
            let rankLabel: UILabel = {
                let label = UILabel()
                label.textAlignment = .center
                label.font = .systemFont(ofSize: 16, weight: .bold)
                label.backgroundColor = .white
                label.textColor = .black
                return label
            }()
            
            let titleLabel: UILabel = {
                let label = UILabel()
                label.textColor = .white
                label.font = .systemFont(ofSize: 16, weight: .bold)
                return label
            }()
            let dateLabel: UILabel = {
                let label = UILabel()
                label.textColor = .white
                label.font = .systemFont(ofSize: 14)
                label.textAlignment = .right
                return label
            }()
            rankLabel.text = String(movie.rank)
            titleLabel.text = movie.title
            dateLabel.text = movie.releaseDate
            
            let cellStackView = configureCellStackViewUI()
            [rankLabel, titleLabel, dateLabel].forEach { label in
                cellStackView.addArrangedSubview(label)
            }
            rankLabel.snp.makeConstraints { make in
                make.width.equalTo(40)
            }
            tableStackView.addArrangedSubview(cellStackView)
        }
    }
    
    func configureTableStack() {
        view.addSubview(tableStackView)
        tableStackView.snp.makeConstraints { make in
            make.top.equalTo(searchStackView.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.bottom.equalTo(-180)
        }
    }
    
    func configureCellStackViewUI() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fill
        return stackView
    }
    
    func configureSearchButton() {
        searchButton.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
    }
    
    func configureSearchStackView() {
        view.addSubview(searchStackView)
        searchStackView.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.height.equalTo(60)
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
