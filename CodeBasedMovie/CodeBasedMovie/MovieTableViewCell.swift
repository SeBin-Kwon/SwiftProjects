//
//  MovieTableViewCell.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/14/25.
//

import UIKit
import SnapKit

final class MovieTableViewCell: UITableViewCell {
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.backgroundColor = .white
        label.textColor = .black
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(rankLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        
        rankLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide)
            make.width.equalTo(40)
            make.height.equalTo(25)
        }
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide)
            make.centerY.equalTo(rankLabel)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(rankLabel.snp.trailing).offset(20)
            make.trailing.equalTo(dateLabel.snp.leading).offset(-20)
            make.centerY.equalTo(rankLabel)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(_ cell: Movie) {
        rankLabel.text = cell.rank
        titleLabel.text = cell.movieNm
        dateLabel.text = cell.openDt
    }
    
}
