//
//  MainTabbarController.swift
//  PodcastApp
//
//  Created by Akhadjon Abdukhalilov on 11/24/20.
//

import UIKit

class MainTabbarController:UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .purple
        
         setupViewControllers()
    }
    
    //MARK:- Setup functions
    
    func setupViewControllers(){
        
            viewControllers = [
                generateNavigationController(with: PodcastsSearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
                generateNavigationController(with: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
                generateNavigationController(with: ViewController(), title: "Downloads", image: #imageLiteral(resourceName: "downloads"))
            ]
    }
    
    
    //MARK:- Helper functions
    
    fileprivate func generateNavigationController(with rootViewController:UIViewController, title:String,image:UIImage)->UIViewController{
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
