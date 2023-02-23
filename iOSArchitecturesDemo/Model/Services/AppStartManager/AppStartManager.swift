//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    let mainTabBar = UITabBarController()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let searchAppVC = SearchAssembly.make()
        searchAppVC.navigationItem.title = "Search via AppStore"
        let searchSong = SearchSongAssembly.make()
        searchSong.navigationItem.title = "Search via iTunes"
        
        var firstTabNavigationController : UINavigationController!
        var secondTabNavigationControoller : UINavigationController!
        
        firstTabNavigationController = UINavigationController.init(rootViewController: searchAppVC)
        secondTabNavigationControoller = UINavigationController.init(rootViewController: searchSong)
        
        mainTabBar.viewControllers = [firstTabNavigationController, secondTabNavigationControoller]
        
        firstTabNavigationController.navigationBar.barTintColor = UIColor.varna
        firstTabNavigationController.navigationBar.isTranslucent = false
        firstTabNavigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        firstTabNavigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        secondTabNavigationControoller.navigationBar.barTintColor = UIColor.varna
        secondTabNavigationControoller.navigationBar.isTranslucent = false
        secondTabNavigationControoller.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        secondTabNavigationControoller.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]


        let appItem = UITabBarItem(title: "AppStore", image: UIImage(named: "icons8-apple_app_store_filled"), tag: 0)
        let songItem = UITabBarItem(title: "iTunes", image:  UIImage(named: "icons8-itunes_filled"), tag: 1)
        
        firstTabNavigationController.tabBarItem = appItem
        secondTabNavigationControoller.tabBarItem = songItem
        
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 248/255.0, alpha: 1.0)

        self.window?.rootViewController = mainTabBar

        window?.makeKeyAndVisible()

    }
}
