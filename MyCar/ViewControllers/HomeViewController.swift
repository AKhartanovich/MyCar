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
    
    let infoLable: UILabel = {
        let infoLable = UILabel()
        infoLable.text = "Add your car"
        infoLable.textColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        infoLable.translatesAutoresizingMaskIntoConstraints = false
        return infoLable
    }()
    
    let fuelLitres: UITextField = {
       let fuelLitres = UITextField()
        fuelLitres.translatesAutoresizingMaskIntoConstraints = false
        return fuelLitres
    }()
    
    let insertButton: UIButton = {
        let insertButton = UIButton()
        insertButton.translatesAutoresizingMaskIntoConstraints = false
        insertButton.backgroundColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        insertButton.layer.cornerRadius = 20
        insertButton.alpha = 0.5
        insertButton.setTitle("Login", for: .normal)
        insertButton.setTitleColor(.white, for: .normal)
        insertButton.addTarget(self, action: #selector(insertButtonTap(_:)), for: .touchUpInside)
        return insertButton
    }()
    
    override func loadView() {
        super.loadView()
//        view.backgroundColor = .red
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.image = UIImage(named: "home.jpg")
        
        view.addSubview(infoLable)
        infoLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        view.addSubview(rootView)
        rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        rootView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        rootView.addSubview(fuelLitres)
        createCustomTextField(fuelLitres)
        fuelLitres.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 10).isActive = true
        fuelLitres.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        fuelLitres.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        fuelLitres.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fuelLitres.setPlaceHolderWith(color: .white, text: "Count of fuel:")
        
        rootView.addSubview(insertButton)
        insertButton.topAnchor.constraint(equalTo: fuelLitres.bottomAnchor, constant: 10).isActive = true
        insertButton.leadingAnchor.constraint(equalTo: fuelLitres.leadingAnchor).isActive = true
        insertButton.trailingAnchor.constraint(equalTo: fuelLitres.trailingAnchor).isActive = true
        insertButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    @objc func insertButtonTap(_: UIButton){
//        guard let fuel = fuelLitres.text else {return}
    }


}
