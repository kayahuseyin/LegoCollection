//
//  LCTabBarController.swift
//  LegoCollection
//
//  Created by Hüseyin Kaya on 1.02.2024.
//

import UIKit

class LCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = Constants.legoRed
        viewControllers = [createSearchNC(), createFavoritesNC()]
    }
    
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesNC = FavoritesListVC()
        favoritesNC.title = "Favorites"
        favoritesNC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesNC)
    }
    
}
