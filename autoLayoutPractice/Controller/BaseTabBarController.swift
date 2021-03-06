//
//  BaseTabBarController.swift
//  autoLayoutPractice
//
//  Created by 石川大輔 on 2021/06/14.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
        ]
        
    }
    
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
        
    }
    
}
