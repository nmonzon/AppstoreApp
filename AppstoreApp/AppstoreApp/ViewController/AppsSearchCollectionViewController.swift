//
//  AppsSearchCollectionViewController.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 13/03/2022.
//

import UIKit

class AppsSearchCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
