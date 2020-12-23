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
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
         imageView.activateConstraint()
         return imageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    
}
