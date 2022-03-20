//
//  searchResultCollectionViewCell.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 13/03/2022.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    var appResultsVM: SearchResultViewModel? {
        didSet {
            guard let appResultsVM = appResultsVM else {
                return
            }
            nameAppLabel.text   = appResultsVM.appName
            categoryLabel.text  = appResultsVM.category
            ratingsLabel.text   = appResultsVM.rating
            appIconImageView.sd_setImage(with: URL(string: appResultsVM.appLogo))
            screenshot1ImageView.sd_setImage(with: URL(string: appResultsVM.screenShoot1))
            screenshot2ImageView.sd_setImage(with: URL(string: appResultsVM.screenShoot2))
            screenshot3ImageView.sd_setImage(with: URL(string: appResultsVM.screenShoot3))
        }
    }
    
    private let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.white
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    private let getButton: UIButton = {
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
    
    private let nameAppLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Instagram"
        return lbl
    }()
    
    private let categoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Photo & Video"
        return lbl
    }()
    
    private let ratingsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "9.26M"
        return lbl
    }()
    
    private lazy var screenshot1ImageView = self.createScreenshotImageView()
    private lazy var screenshot2ImageView = self.createScreenshotImageView()
    private lazy var screenshot3ImageView = self.createScreenshotImageView()
    
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
        screenshotIV.backgroundColor = UIColor.white
        screenshotIV.layer.cornerRadius = 8.0
        screenshotIV.clipsToBounds = true
        screenshotIV.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        screenshotIV.layer.borderWidth = 0.5
        return screenshotIV
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
