//
//  AppRowCell.swift
//  autoLayoutPractice
//
//  Created by 石川大輔 on 2021/06/25.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 16))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    
    let getButtom = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .purple
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        getButtom.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButtom.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getButtom.heightAnchor.constraint(equalToConstant: 32).isActive = true
        getButtom.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButtom.layer.cornerRadius = 32 / 2
        
//        let VstackView = UIStackView(arrangedSubviews: [
//            nameLabel, companyLabel
//        ])
//        VstackView.axis = .vertical
//        VstackView.spacing = 4
//
//        let stackView = UIStackView(arrangedSubviews: [
//            imageView, VstackView, getButtom
//        ])
        
    
        let stackView = UIStackView(arrangedSubviews: [
            imageView, VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4), getButtom
        ])
        
        stackView.spacing = 16
        
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
