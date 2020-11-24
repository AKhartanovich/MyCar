//
//  HomeViewController.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//

import UIKit
//import RealmSwift

class HomeViewController: UIViewController {
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let rootView: UIView = {
       let rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
    override func loadView() {
        super.loadView()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.rgb(red: 113, green: 134, blue: 255)]
        self.title = "Hi"
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.image = UIImage(named: "home.jpg")
        
        view.addSubview(rootView)
        rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        rootView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
    }
    
    @objc func insertButtonTap(_: UIButton){
//        guard let fuel = fuelLitres.text else {return}
    }


}
