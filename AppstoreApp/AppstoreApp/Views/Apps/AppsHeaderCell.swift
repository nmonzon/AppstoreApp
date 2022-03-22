//
//  AppsHeaderCell.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 21/03/2022.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    private let lblCompanyLabel: UILabel = {
        let lblCompanyLabel = UILabel(title: "Facebook", font: UIFont.boldSystemFont(ofSize: 12))
        lblCompanyLabel.textColor = .blue
        return lblCompanyLabel
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel(title: "Keeping up with friends is faster than ever", font: UIFont.systemFont(ofSize: 24))
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(cornerRadius: 8)
        imageView.backgroundColor = .red
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let verticalStack = VerticalStackView(arrangedSubviews: [
            lblCompanyLabel,
            titleLabel,
            imageView
        ], spacing: 12)
        backgroundColor = .white
        addSubview(verticalStack)
        verticalStack.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
