//
//  AppsController.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 20/03/2022.
//

import UIKit

class AppsPageController: BaseListController{
    
    private let appsCellId = "appsCellId"
    private let collectionHeaderId = "collectionHeaderId"
    private var appGroups: [AppGroup] = []
    private var socialApps: [SocialApp] = []
    private let activityIndicator: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView()
        aiv.style = .large
        aiv.color = UIColor.black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    
    private func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        var appGroupFreeApps: AppGroup?
        var appGroupPaidApps: AppGroup?
        var appGroupBooks: AppGroup?
        
        dispatchGroup.enter()
        Service.shared.fetchGenericData(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json") { (appGroup: AppGroup?, error: Error?) in
            dispatchGroup.leave()
            if let error = error {
                print("Failed to fetch free apps", error)
                return
            }
            appGroupFreeApps = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchGenericData(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/25/apps.json") { (appGroup: AppGroup?, error: Error?) in
            dispatchGroup.leave()
            if let error = error {
                print("Failed to fetch paid Apps", error)
                return
            }
            appGroupPaidApps = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchGenericData(urlString: "https://rss.applemarketingtools.com/api/v2/us/books/top-free/10/books.json") { (appGroup: AppGroup?, error: Error?) in
            dispatchGroup.leave()
            if let error = error {
                print("Failed to fetch books", error)
                return
            }
            appGroupBooks = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchGenericData(urlString: "https://api.letsbuildthatapp.com/appstore/social") { (socialApps: [SocialApp]?, error: Error?) in
            dispatchGroup.leave()
            if let error = error {
                print("Failed to fetch social Apps", error)
            }
            self.socialApps = socialApps ?? []
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activityIndicator.stopAnimating()
            if let appGroupFreeApps = appGroupFreeApps {
                self.appGroups.append(appGroupFreeApps)
            }
            if let appGroupPaidApps = appGroupPaidApps {
                self.appGroups.append(appGroupPaidApps)
            }
            if let appGroupBooks = appGroupBooks {
                self.appGroups.append(appGroupBooks)
            }
            self.collectionView.reloadData()
        }
    }
}

/**
    Setup UI
 */

extension AppsPageController {
    private func setupUI() {
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(AppsPageHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionHeaderId)
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: appsCellId)
        collectionView.backgroundColor = .white
    }
}

extension AppsPageController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionHeaderId, for: indexPath) as! AppsPageHeaderCell
        cell.appsHeaderHorizontalController.socialApps = self.socialApps
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appsCellId, for: indexPath) as! AppsGroupCell
        cell.appGroup = appGroups[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
