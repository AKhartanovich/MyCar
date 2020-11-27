//
//  HomeViewController.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//

import UIKit
//import RealmSwift


///Таббарконтроллер в который содержит массив навигейшнконтроллеров
class RootTabBarController: UITabBarController {
    
    override func loadView() {
        super.loadView()
        
        let homeVC = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeVC)
        homeNavigationController.navigationBar.isHidden = true
        homeNavigationController.title = "Home page"
        UITabBar.setTransparentTabbar()
        UITabBar.appearance().tintColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        UITabBar.appearance().unselectedItemTintColor = .white
        homeNavigationController.tabBarItem.image = UIImage.init(named: "homeIcon.png")
        viewControllers = [homeNavigationController]
        
        let gasolineViewController = GasolineViewController()
        let gasolineNavgitaionController = UINavigationController(rootViewController: gasolineViewController)
        gasolineNavgitaionController.navigationBar.isHidden = true
        gasolineNavgitaionController.title = "Refueling"
        gasolineNavgitaionController.tabBarItem.image = UIImage.init(named: "fuelIcon.png")
        var array = self.viewControllers
        array?.append(gasolineNavgitaionController)
        self.viewControllers = array

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
