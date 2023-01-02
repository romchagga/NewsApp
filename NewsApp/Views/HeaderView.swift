//
//  HeaderView.swift
//  NewsApp
//
//  Created by macbook on 03.01.2023.
//

import UIKit

class HeaderView: UIView {
    
    private var fontSize: CGFloat
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "News"
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        return label
    }()
    
    private lazy var headerCircleImage: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        imageV.image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return imageV
    }()
    
    private lazy var subheadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(fontSize)
        label.text = "Главные новости"
        label.textColor = .gray
        return label
    }()
    
    private lazy var headerStack: UIView = {
        let stack = UIStackView(arrangedSubviews: [headerCircleImage , headingLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpView() {
        addSubview(headerStack)
        addSubview(subheadLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStack.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subheadLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadLabel.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 8),
            subheadLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
