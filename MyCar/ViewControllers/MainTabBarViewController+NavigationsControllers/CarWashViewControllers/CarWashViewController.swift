//
//  CarWashViewController.swift
//  MyCar
//
//  Created by MacBook on 15.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

class CarWashViewController: UIViewController {
    
    let stackViewWithLabels: UIStackView = {
        let stackView = UIStackView()
        stackView.activateConstraint()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let labelViewWithInfo: UIView = {
       let l = UIView()
        l.activateConstraint()
        return l
    }()
    
    let infoLabel: UILabel = {
       let label = UILabel()
        label.activateConstraint()
        label.textColor = .rgb(red: 211, green: 211, blue: 211)
        label.text = "Car wash"
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
         imageView.activateConstraint()
         return imageView
    }()
    
    override func loadView() {
        super.loadView()
        createLayaot()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func createLayaot(){
        view.addSubview(imageView)
        imageView.fillSuperView()
        imageView.image = UIImage(named: "i.jpg")
        
        view.addSubview(infoLabel)
        infoLabel.top(equalTo: view.topAnchor, constant: 40)
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.height(constant: 40)
        
        
    }
}
