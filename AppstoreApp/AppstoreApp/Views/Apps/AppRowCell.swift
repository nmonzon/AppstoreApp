//
//  AppRowCell.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 21/03/2022.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    private let appIconImageView: UIImageView = {
        let iv = UIImageView(cornerRadius: 12)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.constrainWidth(constant: 54)
        iv.constrainHeight(constant: 54)
        return iv
    }()
    
    private let getButton: UIButton = {
        let btn = UIButton(title: "GET")
        btn.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.constrainWidth(constant: 80)
        btn.constrainHeight(constant: 32)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        btn.layer.cornerRadius = 32 / 2
        return btn
    }()
    
    private let nameAppLabel: UILabel = {
        let lbl = UILabel(title: "App Name", font: UIFont.systemFont(ofSize: 16))
        return lbl
    }()
    
    private let companyLabel: UILabel = {
        let lbl = UILabel(title: "Company Name", font: UIFont.systemFont(ofSize: 13))
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let appHorizontalStackView = UIStackView(arrangedSubviews: [
            appIconImageView,
            nameAppLabel,
            getButton
        ])
        appHorizontalStackView.alignment = .center
        appHorizontalStackView.spacing = 16
        addSubview(appHorizontalStackView)
        appHorizontalStackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
