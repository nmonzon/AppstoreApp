//
//  HorizontalSnappingController.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 23/03/2022.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    
    init() {
        let layout = SnappingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

 
