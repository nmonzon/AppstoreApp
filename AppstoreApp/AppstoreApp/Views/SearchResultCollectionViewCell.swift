//
//  searchResultCollectionViewCell.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 13/03/2022.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    fileprivate let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.red
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    fileprivate let getButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("GET", for: .normal)
        btn.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    let nameAppLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Instagram"
        return lbl
    }()
    
    let categoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Photo & Video"
        return lbl
    }()
    
    let ratingsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "9.26M"
        return lbl
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView,
            VerticalStackView(arrangedSubviews: [nameAppLabel,
                                                 categoryLabel,
                                                 ratingsLabel]),
            getButton
        ])
        infoTopStackView.axis = .horizontal
        infoTopStackView.alignment = .center
        infoTopStackView.spacing = 12
        
        let screenshootsStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView, screenshot2ImageView, screenshot3ImageView
        ])
        screenshootsStackView.axis = .horizontal
        screenshootsStackView.spacing = 12
        screenshootsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView, screenshootsStackView
        ], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    fileprivate func createScreenshotImageView() -> UIImageView {
        let screenshotIV = UIImageView()
        screenshotIV.backgroundColor = UIColor.blue
        return screenshotIV
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
