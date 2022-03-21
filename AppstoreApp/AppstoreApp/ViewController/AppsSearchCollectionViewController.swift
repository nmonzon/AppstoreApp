//
//  AppsSearchCollectionViewController.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 13/03/2022.
//

import UIKit
import SDWebImage

class AppsSearchCollectionViewController: BaseListController {

    private let cellId = "cellId"
    private let searchController = UISearchController(searchResultsController: nil)
    private var timer: Timer?
    private var appResultsVM: [SearchResultViewModel] = []
    
    private let lblSearchTerm: UILabel = {
        let lblSearchTerm = UILabel()
        lblSearchTerm.translatesAutoresizingMaskIntoConstraints = false
        lblSearchTerm.text = "Please enter search term above..."
        lblSearchTerm.font = UIFont.boldSystemFont(ofSize: 14)
        lblSearchTerm.textAlignment = .center
        return lblSearchTerm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        setupSearchTerm()
        setupSearchBar()
    }
    
    init() { super.init(collectionViewLayout: UICollectionViewFlowLayout()) }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupSearchTerm() {
        collectionView.addSubview(lblSearchTerm)
        lblSearchTerm.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        lblSearchTerm.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 50).isActive = true
        lblSearchTerm.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 50).isActive = true
        lblSearchTerm.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -50).isActive = true
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

extension AppsSearchCollectionViewController: UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchItunesData(searchText: searchText) { result, error in
                if let error = error {
                    print("Failed to fetch Apps data", error)
                    return
                }
                
                self.appResultsVM = result.map({SearchResultViewModel(result: $0)})
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        lblSearchTerm.isHidden = appResultsVM.count > 0
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
