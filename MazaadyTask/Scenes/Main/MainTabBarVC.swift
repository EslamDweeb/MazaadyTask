//
//  MainTabBarVC.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import Foundation
import UIKit

enum TabBarItems:Int,CaseIterable {
    case Home
    case Discover
    case Message
    case Profile
}

class MainTabBarVC: UITabBarController {
    var coordinator:Coordinator

    init(coordinator:Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       //  Set the custom tabBar
               let customTabBar = LinearIndecatorTabBar()
               setValue(customTabBar, forKey: "tabBar")
        tabBar.tintColor = .primry
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.isTranslucent = false
//       // tabBar.backgroundColor = .darkGray
//        tabBar.selectionIndicatorImage = UIImage(systemName: "rectangle.fill")
        setupTabBar()
    }
    
    private func setupTabBar(){
        viewControllers = TabBarItems.allCases.map({
            let view =  createViewControllerFor($0)
            let navigation = UINavigationController(rootViewController: view)
            navigation.navigationBar.isHidden = true
            navigation.hidesBottomBarWhenPushed = false
            return navigation
        })
    }
    
    private func createViewControllerFor(_ item:TabBarItems)->UIViewController{
        switch item {
        case .Home:
            let vc = coordinator.main.viewController(for: .home)
            vc.tabBarItem = createTabBarItem(for: item)
            return vc
        case .Discover:
            let vc = UIViewController()
            vc.tabBarItem = createTabBarItem(for: item)
            return vc
        case .Message:
            let vc = UIViewController()
            vc.tabBarItem = createTabBarItem(for: item)
            return vc
        case .Profile:
            let vc = UIViewController()
            vc.tabBarItem = createTabBarItem(for: item)
            return vc
        }
    }
    private func createTabBarItem(for item: TabBarItems)-> UITabBarItem?{
        let tabBarItem:UITabBarItem
        switch item {
        case .Home:
            tabBarItem = .init(title: "", image: UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate).withTintColor(.lightGray), selectedImage: UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate).withTintColor(.primry))
        case .Discover:
            tabBarItem = .init(title: "", image: UIImage(named: "location")?.withRenderingMode(.alwaysTemplate).withTintColor(.lightGray), selectedImage: UIImage(named: "location")?.withRenderingMode(.alwaysTemplate).withTintColor(.primry))

        case .Message:
            tabBarItem = .init(title: "", image: UIImage(named: "message")?.withRenderingMode(.alwaysTemplate).withTintColor(.lightGray), selectedImage: UIImage(named: "message")?.withRenderingMode(.alwaysTemplate).withTintColor(.primry))
        case .Profile:
            tabBarItem = .init(title: "", image: UIImage(named: "profile")?.withRenderingMode(.alwaysTemplate).withTintColor(.lightGray), selectedImage: UIImage(named: "profile")?.withRenderingMode(.alwaysTemplate).withTintColor(.primry))
        }
        
        //        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 15)
      // tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
        return tabBarItem
        
    }
}
