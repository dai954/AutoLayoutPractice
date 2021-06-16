//
//  SearchResultCell.swift
//  autoLayoutPractice
//
//  Created by 石川大輔 on 2021/06/14.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            appIconImage.sd_setImage(with: URL(string: appResult.artworkUrl100))
            screenShot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            
            if appResult.screenshotUrls.count > 1 {
                screenShot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if appResult.screenshotUrls.count > 2 {
                screenShot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    let appIconImage: UIImageView = {
        let iv = UIImageView()
//        iv.backgroundColor = .yellow
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenShot1ImageView = self.createScreenshotImageView()
    lazy var screenShot2ImageView = self.createScreenshotImageView()
    lazy var screenShot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let screenShotImageView = UIImageView()
//        screenShotImageView.backgroundColor = .green
        screenShotImageView.layer.cornerRadius = 8
        screenShotImageView.clipsToBounds = true
        screenShotImageView.layer.borderWidth = 0.5
        screenShotImageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        return screenShotImageView
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStackView = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingLabel
        ])
        labelStackView.axis = .vertical
        
        let infoToptackView = UIStackView(arrangedSubviews: [
            appIconImage, labelStackView, getButton
        ])
        
        infoToptackView.spacing = 12
        infoToptackView.alignment = .center
        
        let screenShotStackView = UIStackView(arrangedSubviews: [
            screenShot1ImageView, screenShot2ImageView, screenShot3ImageView
        ])
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
        let overallStackView = UIStackView(arrangedSubviews: [
            infoToptackView, screenShotStackView
        ])
        overallStackView.axis = .vertical
        overallStackView.spacing = 16
        
        addSubview(overallStackView)
        overallStackView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
