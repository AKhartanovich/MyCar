//
//  HomeViewController.swift
//  MyCar
//
//  Created by MacBook on 24.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    var dataCalc: (Double,Double,Double,Int) = (0,0,0,0)
    
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
    
    let labal1: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    let labal2: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    let labal3: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    
    let test: UIButton = {
        let test = UIButton()
        test.translatesAutoresizingMaskIntoConstraints = false
        test.setTitle("test scroll", for: .normal)
        test.setTitleColor(.white, for: .normal)
        test.addTarget(self, action: #selector(test(_:)), for: .touchUpInside)
        return test
    }()
    
    let test1: UIButton = {
        let test = UIButton()
        test.translatesAutoresizingMaskIntoConstraints = false
        test.setTitle("test collection", for: .normal)
        test.setTitleColor(.white, for: .normal)
        test.addTarget(self, action: #selector(test1(_:)), for: .touchUpInside)
        return test
    }()
    
    
    override func loadView() {
        super.loadView()
//        dataCalc = calculateAverageConsumption()
        
        view.addSubview(imageView)
        imageView.fillSuperView()
        imageView.image = UIImage(named: "i.jpg")
        print(UserDataManager.instance.UUID)

        view.addSubview(rootView)
        rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        rootView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        rootView.addSubview(labal1)
        labal1.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 20).isActive = true
        labal1.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 10).isActive = true
        labal1.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -10).isActive = true
        labal1.textAlignment = .left
        labal1.text = "Средний расход: " + String(Double(round(10*dataCalc.0)/10)) + " л/100км"
        
        rootView.addSubview(labal2)
        labal2.topAnchor.constraint(equalTo: labal1.bottomAnchor, constant: 20).isActive = true
        labal2.leadingAnchor.constraint(equalTo: labal1.leadingAnchor).isActive = true
        labal2.trailingAnchor.constraint(equalTo: labal1.trailingAnchor, constant: -10).isActive = true
        labal2.textAlignment = .left
        labal2.text = "Потрачено денег на топливо: " + String(dataCalc.1) + " BYN"
        
        rootView.addSubview(labal3)
        labal3.topAnchor.constraint(equalTo: labal2.bottomAnchor, constant: 20).isActive = true
        labal3.leadingAnchor.constraint(equalTo: labal2.leadingAnchor).isActive = true
        labal3.trailingAnchor.constraint(equalTo: labal2.trailingAnchor, constant: -10).isActive = true
        labal3.textAlignment = .left
        labal3.text = "Общий пробег : " + String(dataCalc.2) + " Km"
        
        rootView.addSubview(test)
        test.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        test.centerYAnchor.constraint(equalTo: rootView.centerYAnchor).isActive = true
        test.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        rootView.addSubview(test1)
        test1.topAnchor.constraint(equalTo: test.bottomAnchor, constant: 20).isActive = true
        test1.leadingAnchor.constraint(equalTo: test.leadingAnchor).isActive = true
        test1.trailingAnchor.constraint(equalTo: test.trailingAnchor).isActive = true
        
        test1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        dataCalc = calculateAverageConsumption()
    }
    
    @objc
    func test(_: UIButton) {
        navigationController?.pushViewController(ScrollViewViewController(), animated: true)
    }
    @objc
    func test1(_: UIButton) {
        navigationController?.pushViewController(CollectionViewController(), animated: true)
    }

}
