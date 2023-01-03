//
//  ShadowImageView.swift
//  NewsApp
//
//  Created by macbook on 03.01.2023.
//

import UIKit

class ShadowImageView: UIView {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var basedShadowView: UIView = {
        let basedShadowView = UIView()
        basedShadowView.translatesAutoresizingMaskIntoConstraints = false
        basedShadowView.backgroundColor = .clear
        basedShadowView.layer.shadowColor = UIColor.black.cgColor
        basedShadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        basedShadowView.layer.shadowOpacity = 0.7
        basedShadowView.layer.shadowRadius = 10
        return basedShadowView
    }()
    
    init() {
        super.init(frame: .zero)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(basedShadowView)
        basedShadowView.addSubview(imageView)
        setupConstraints()
    }
    
    func setupConstraints() {
            NSLayoutConstraint.activate([
                basedShadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                basedShadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                basedShadowView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                basedShadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ])
            
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        basedShadowView.layer.shadowPath = UIBezierPath(roundedRect: basedShadowView.bounds, cornerRadius: 10).cgPath
        basedShadowView.layer.shouldRasterize = true
        basedShadowView.layer.rasterizationScale = UIScreen.main.scale  
    }
}
