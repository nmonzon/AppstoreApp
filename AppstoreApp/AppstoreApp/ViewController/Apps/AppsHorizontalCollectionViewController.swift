//
//  AppsHorizontalCollectionViewController.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 20/03/2022.
//

import UIKit

class AppsHorizontalCollectionViewController: HorizontalSnappingController {
    
    private let appsHorizontalCellId = "appsHorizontalCellId"
    private let topBottomPadding = 12.0
    private let lineSpacing = 10.0
    var appGroup: AppGroup? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: appsHorizontalCellId)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}


extension AppsHorizontalCollectionViewController: UICollectionViewDelegateFlowLayout {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appsHorizontalCellId, for: indexPath) as! AppRowCell
        cell.feedResult = appGroup?.feed.results[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return CGSize(width: view.frame.width - 48.0, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topBottomPadding, left: 0, bottom: topBottomPadding, right: 0)
    }
}

