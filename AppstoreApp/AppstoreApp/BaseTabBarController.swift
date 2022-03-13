//
//  BaseTabBarController.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 13/03/2022.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redVC = UIViewController()
        redVC.view.backgroundColor = UIColor.red
        redVC.navigationItem.title = "Apps"
        let redNavController = UINavigationController(rootViewController: redVC)
        redNavController.tabBarItem.title = "Apps"
        redNavController.navigationBar.prefersLargeTitles = true
        
        
        let blueVC = UIViewController()
        blueVC.view.backgroundColor = UIColor.blue
        blueVC.navigationItem.title = "Search"
        let blueNavController = UINavigationController(rootViewController: blueVC)
        blueNavController.tabBarItem.title = "Search"
        blueNavController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [
            redNavController, blueNavController
        ]
    }
}
