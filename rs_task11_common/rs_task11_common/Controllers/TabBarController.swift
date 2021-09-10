//
//  ViewController.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 9.09.21.
//

import UIKit

extension TabBarController {
    struct Appearance {
        let rocket: UIImage = UIImage(named: "rocket")!
        let rocketSelected: UIImage = UIImage(named: "rocketSelected")!
        
        let adjustment: UIImage = UIImage(named: "adjustment")!
        let adjustmentSelected: UIImage = UIImage(named: "adjustmentSelected")!
        
        let lego: UIImage = UIImage(named: "lego")!
        let legoSelected: UIImage = UIImage(named: "legoSelected")!
        
        let tabBarColor: UIColor = UIColor(rgb: 0x607499)
        let tabBarSelectedColor: UIColor = UIColor(rgb: 0xFF8552)
    }
}

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    //MARK:- Private properties
    
    private let appearance = Appearance()
    
    //MARK:- UI Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTabBar()
        setupNavigationBar()
    }
    
    //MARK:- Setup UI
    
    private func setupTabBar() {
        UITabBar.appearance().backgroundColor = appearance.tabBarColor
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().tintColor = appearance.tabBarSelectedColor
        UITabBar.appearance().isTranslucent = true
        
        let rockets = RocketsViewController()
        let rocketsTapBarItem = UITabBarItem(title: "Rockets", image: appearance.rocket, selectedImage: appearance.rocketSelected)
        rockets.tabBarItem = rocketsTapBarItem
        
        let launches = LaunchesViewController()
        let launchesTapBarItem = UITabBarItem(title: "Launches", image: appearance.adjustment, selectedImage: appearance.adjustmentSelected)
        launches.tabBarItem = launchesTapBarItem
        
        let launchpads = LaunchpadsViewController()
        let launchpadsTapBarItem = UITabBarItem(title: "Launchpads", image: appearance.lego, selectedImage: appearance.legoSelected)
        launchpads.tabBarItem = launchpadsTapBarItem
        
        self.setViewControllers([rockets, launches, launchpads], animated: true)
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.backgroundColor = appearance.tabBarColor
        self.navigationController?.navigationBar.tintColor = appearance.tabBarSelectedColor
        
        let sortButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = sortButton
    }
}

