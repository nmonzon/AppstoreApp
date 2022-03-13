//
//  searchResultCollectionViewCell.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 13/03/2022.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    fileprivate let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.red
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return iv
    }()
    
    fileprivate let getButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("GET", for: .normal)
        btn.backgroundColor = .darkGray
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        return btn
    }()
    
    fileprivate let nameAppLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Instagram"
        return lbl
    }()
    
    fileprivate let categoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Photo & Video"
        return lbl
    }()
    
    fileprivate let ratingsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "9.26M"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        let namesStackView = UIStackView(arrangedSubviews: [
            nameAppLabel,
            categoryLabel,
            ratingsLabel
        ])
        namesStackView.axis = .vertical
        
        let horizontalStackView = UIStackView(arrangedSubviews: [
            logoImageView,
            namesStackView,
            getButton
        ])
        
        
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 12
        addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        horizontalStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
