//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by macbook on 03.01.2023.
//

import Foundation
import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    var newsVM: NewsViewModel? {
        didSet {
            if let newsVM = newsVM {
                titleLabel.text = newsVM.title
                NetwrokManager.shared.getImage(urlString: newsVM.urlToImage) { data in
                    guard let data = data else {return}
                    DispatchQueue.main.async {
                        self.newsImageView.image = UIImage(data: data)
                    }
                }
                }
            }
        }
    
    var newsImageData: Data? {
        didSet {
            if let data = newsImageData {
                newsImageView.image = UIImage(data: data)
            }
        }
    }
    
    private lazy var newsImageView: ShadowImageView = {
        let newsImageView = ShadowImageView()
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        return newsImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor(red: 31/255, green: 33/255, blue: 37/255, alpha: 1)
        addSubview(titleLabel)
        addSubview(newsImageView)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImageView.topAnchor.constraint(equalTo: topAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

