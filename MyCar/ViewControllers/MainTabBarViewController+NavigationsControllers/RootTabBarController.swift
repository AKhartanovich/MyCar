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
        homeNavigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        homeNavigationController.navigationBar.shadowImage = UIImage()
        homeNavigationController.navigationBar.isTranslucent = true
        homeNavigationController.view.backgroundColor = UIColor.clear
        homeNavigationController.navigationBar.isHidden = false
        homeNavigationController.title = "Home page"
        UITabBar.setTransparentTabbar()
        UITabBar.appearance().tintColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        UITabBar.appearance().unselectedItemTintColor = .systemGray5
        homeNavigationController.tabBarItem.image = UIImage.init(named: "homeIcon.png")
        viewControllers = [homeNavigationController]
        
        let carWashVC = CarWashViewController()
        let carWashNC = UINavigationController(rootViewController: carWashVC)
        carWashNC.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        carWashNC.navigationBar.shadowImage = UIImage()
        carWashNC.navigationBar.isTranslucent = true
        carWashNC.view.backgroundColor = UIColor.clear
        carWashNC.navigationBar.isHidden = false
        carWashNC.title = "Car wash"
        carWashNC.tabBarItem.image = UIImage.init(named: "car-wash.png")
        self.viewControllers?.append(carWashNC)
        
        let gasolineViewController = GasolineViewController()
        let gasolineNavgitaionController = UINavigationController(rootViewController: gasolineViewController)
        gasolineNavgitaionController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        gasolineNavgitaionController.navigationBar.shadowImage = UIImage()
        gasolineNavgitaionController.navigationBar.isTranslucent = true
        gasolineNavgitaionController.view.backgroundColor = UIColor.clear
        gasolineNavgitaionController.navigationBar.isHidden = false
        gasolineNavgitaionController.title = "Refueling"
        gasolineNavgitaionController.tabBarItem.image = UIImage.init(named: "fuelIcon.png")
        self.viewControllers?.append(gasolineNavgitaionController)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
