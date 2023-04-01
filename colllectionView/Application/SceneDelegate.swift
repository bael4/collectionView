//
//  SceneDelegate.swift
//  colllectionView
//
//  Created by Баэль Рыспеков on 31/3/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions:
               UIScene.ConnectionOptions) {
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        
        let contactsVC = ContactsViewController()
        let tabBarItemContacts = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.fill"), selectedImage: UIImage(systemName: "person.fill"))
        contactsVC.tabBarItem = tabBarItemContacts
        let navigation = UINavigationController(rootViewController: contactsVC)
        
        
        let favoritesVC = FavoritesViewController()
        let tabBarItemFavorites = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star"))
        favoritesVC.tabBarItem = tabBarItemFavorites
        
        let recentsVC = RecentsViewController()
        let tabBarItemRecents = UITabBarItem(title: "Recents", image: UIImage(systemName: "clock"), selectedImage: UIImage(systemName: "clock"))
        recentsVC.tabBarItem = tabBarItemRecents
        
        
        let dialPadVC = DialPadViewController()
        let tabBarItemDialPad = UITabBarItem(title: "DialPad", image: UIImage(systemName: "circle.grid.3x3.fill"), selectedImage: UIImage(systemName: "circle.grid.3x3.fill"))
        dialPadVC.tabBarItem = tabBarItemDialPad
        
        
        let voiceEmailVC = VoiceEmailViewController()
        let tabBarItemVoiceEmail = UITabBarItem(title: "Voicemail", image: UIImage(systemName: "infinity"), selectedImage: UIImage(systemName: "infinity"))
        voiceEmailVC.tabBarItem = tabBarItemVoiceEmail
        
        
        let tabbarController = UITabBarController()
        
        tabbarController.viewControllers = [favoritesVC,recentsVC,navigation,dialPadVC,voiceEmailVC]
        
        tabbarController.tabBar.backgroundColor = .white
        
        window.rootViewController = tabbarController
        self.window = window
        window.makeKeyAndVisible()
        
        
    }



}

