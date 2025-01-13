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
        textfield.backgroundColor = .red
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
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(searchButton)
        return stackView
    }()
    
    let rankLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        return label
    }()
    let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        return label
    }()
    let dateLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    lazy var cellView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
//        stackView.addArrangedSubview(rankLabel)
//        stackView.addArrangedSubview(titleLabel)
//        stackView.addArrangedSubview(dateLabel)
        return stackView
    }()
    
    lazy var tableStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        configureSearchStackView()
        configureSearchButton()
        configureTable()
    }
    
    func configureTable() {
        view.addSubview(tableStackView)
        movieList.forEach { movie in
            rankLabel.text = String(movie.rank)
            titleLabel.text = movie.title
            dateLabel.text = movie.releaseDate
            cellView.addArrangedSubview(rankLabel)
            cellView.addArrangedSubview(titleLabel)
            cellView.addArrangedSubview(dateLabel)
            tableStackView.addArrangedSubview(cellView)
            cellView.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }
        tableStackView.snp.makeConstraints { make in
            make.top.equalTo(searchStackView.snp.bottom)
            make.height.equalTo(400)
        }
    }
    
    func configureSearchButton() {
        searchButton.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
    }
    
    func configureSearchStackView() {
        view.addSubview(searchStackView)
        searchStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
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
