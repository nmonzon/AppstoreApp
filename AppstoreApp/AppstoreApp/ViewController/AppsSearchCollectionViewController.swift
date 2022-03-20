//
//  AppsSearchCollectionViewController.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 13/03/2022.
//

import UIKit
import SDWebImage

class AppsSearchCollectionViewController: UICollectionViewController {

    private let cellId = "cellId"
    private var appResultsVM: [SearchResultViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchItunesData()
    }
    
    init() { super.init(collectionViewLayout: UICollectionViewFlowLayout()) }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func fetchItunesData() {
        Service.shared.fetchItunesData { appResults,error  in
            
            if let error = error {
                print("Failed to fetch Apps data", error)
                return
            }
            
            self.appResultsVM = appResults.map({SearchResultViewModel(result: $0)})
//            self.appResults = appResults
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension AppsSearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResultsVM.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCollectionViewCell
        cell.appResultsVM = appResultsVM[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}
