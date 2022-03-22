//
//  AppsPageHeaderCell.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 21/03/2022.
//

import UIKit

class AppsPageHeaderCell: UICollectionViewCell {
    
    private let appsHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .orange
        
        addSubview(appsHeaderHorizontalController.view)
        appsHeaderHorizontalController.collectionView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
