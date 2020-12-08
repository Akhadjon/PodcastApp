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
         setupPlayerDetailsView()
        
    }
    
   
   
    
    @objc func minimizePlayerDetails(){
        maximizedTopAnchorConstrainst.isActive = false
        bottomAnchorConstrainst.constant = view.frame.height
        minimizedTopAnchorConstrainst.isActive = true
       
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut) {
            self.view.layoutIfNeeded()
            let height = self.tabBar.frame.size.height
            let frame = self.tabBar.frame
            self.tabBar.frame = frame.offsetBy(dx: 0, dy: -height)
            self.playerDetailsView.maximizedStackView.alpha = 0
            self.playerDetailsView.miniPlayerView.alpha = 1
        }
    }
    
    func maximizePlayerDetails(episode:Episode?,playlistEpisodes:[Episode] = []){
        minimizedTopAnchorConstrainst.isActive = false
        maximizedTopAnchorConstrainst.isActive = true
        maximizedTopAnchorConstrainst.constant = 0
       
        bottomAnchorConstrainst.constant = 0
        if  episode != nil{
            playerDetailsView.episode = episode
        }
        playerDetailsView.playlistEpisodes = playlistEpisodes
    
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut) {
            self.view.layoutIfNeeded()
            let height = self.tabBar.frame.size.height
            let frame = self.tabBar.frame
            self.tabBar.frame = frame.offsetBy(dx: 0, dy: height)
            
            self.playerDetailsView.maximizedStackView.alpha = 1
            self.playerDetailsView.miniPlayerView.alpha = 0
        }
    }
    
    //MARK:- Setup functions
    let playerDetailsView = PlayerDetailsView.initFromNib()
    
    var maximizedTopAnchorConstrainst:NSLayoutConstraint!
    var minimizedTopAnchorConstrainst:NSLayoutConstraint!
    var bottomAnchorConstrainst:NSLayoutConstraint!
    
    fileprivate func setupPlayerDetailsView(){
        print("Setting Up player detail view")
       
     
        
        view.insertSubview(playerDetailsView, belowSubview: tabBar)
        
        playerDetailsView.translatesAutoresizingMaskIntoConstraints = false
      
        maximizedTopAnchorConstrainst = playerDetailsView.topAnchor.constraint(equalTo:view.topAnchor,constant: view.frame.height)
        maximizedTopAnchorConstrainst.isActive = true
        
        bottomAnchorConstrainst =  playerDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: view.frame.height)
        bottomAnchorConstrainst.isActive = true
        minimizedTopAnchorConstrainst = playerDetailsView.topAnchor.constraint(equalTo:tabBar.topAnchor,constant: -64)
    
        
        playerDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        playerDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
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
