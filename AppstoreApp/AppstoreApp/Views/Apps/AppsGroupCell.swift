//
//  AppsGroupCell.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 20/03/2022.
//

import Foundation
import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let appsHorizontalController = AppsHorizontalCollectionViewController()
    var appGroup: AppGroup? {
        didSet {
            if let appGroup = appGroup {
                lblAppSection.text = appGroup.feed.title
                appsHorizontalController.appGroup = appGroup
            }
        }
    }
    
    private let lblAppSection: UILabel = {
        let lblAppSection = UILabel(title: "App Section", font: UIFont.boldSystemFont(ofSize: 30))
        return lblAppSection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(lblAppSection)
        lblAppSection.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(appsHorizontalController.view)
        appsHorizontalController.view.anchor(top: lblAppSection.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
