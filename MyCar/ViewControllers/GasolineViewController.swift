//
//  GasolineViewController.swift
//  MyCar
//
//  Created by MacBook on 24.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit
import CoreData

class GasolineViewController: UIViewController {
    
    let myColor = UIColor.rgb(red: 113, green: 134, blue: 255)
    var dataCalc: (Double,Double,Double,Int) = (0,0,0,0)
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelInfo: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        return label
    }()
    
    let rootView: UIView = {
       let rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
    let labelaverageConsumption: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    
    let viewAverageConsumption: UIView = {
       let rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
    let labelPrice: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    
    let viewPrice: UIView = {
       let rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
    let labelMileage: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    
    let viewMileage: UIView = {
       let rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
    let labelCountRefueling: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    
    let viewCountRefueling: UIView = {
       let rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
    let refuelingButton: UIButton = {
        let refueling = UIButton()
        refueling.translatesAutoresizingMaskIntoConstraints = false
        refueling.backgroundColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        refueling.layer.cornerRadius = 20
        refueling.setTitle("Refueling", for: .normal)
        refueling.setTitleColor(.white, for: .normal)
        refueling.addTarget(self, action: #selector(refuelingButtonTap(_:)), for: .touchUpInside)
        return refueling
    }()
    
    let testButton: UIButton = {
        let refueling = UIButton()
        refueling.translatesAutoresizingMaskIntoConstraints = false
        refueling.backgroundColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        refueling.layer.cornerRadius = 20
        refueling.setTitle("test tableview", for: .normal)
        refueling.setTitleColor(.white, for: .normal)
        refueling.addTarget(self, action: #selector(testButtonTap(_:)), for: .touchUpInside)
        return refueling
    }()
    
    override func loadView() {
        super.loadView()
        dataCalc = calculateAverageConsumption()
        
        view.addSubview(imageView)
        UIView.fillAll(rootView: view, customView: imageView)
        imageView.image = UIImage(named: "gasstation.jpg")
        
        view.addSubview(labelInfo)
        labelInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        labelInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelInfo.textColor = .rgb(red: 211, green: 211, blue: 211)
        labelInfo.text = "Refueling"
        labelInfo.font = UIFont.systemFont(ofSize: 20.0)
        labelInfo.textAlignment = .center
        labelInfo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(rootView)
        rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        rootView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        rootView.addSubview(viewAverageConsumption)
        viewAverageConsumption.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 10).isActive = true
        viewAverageConsumption.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        viewAverageConsumption.trailingAnchor.constraint(equalTo: rootView.centerXAnchor, constant: -10).isActive = true
        viewAverageConsumption.heightAnchor.constraint(equalToConstant: 100).isActive = true
        createCustomView(viewAverageConsumption)
        
        viewAverageConsumption.addSubview(labelaverageConsumption)
        labelaverageConsumption.centerXAnchor.constraint(equalTo: viewAverageConsumption.centerXAnchor).isActive = true
        labelaverageConsumption.centerYAnchor.constraint(equalTo: viewAverageConsumption.centerYAnchor).isActive = true
        labelaverageConsumption.leadingAnchor.constraint(equalTo: viewAverageConsumption.leadingAnchor, constant: 5).isActive = true
        labelaverageConsumption.trailingAnchor.constraint(equalTo: viewAverageConsumption.trailingAnchor, constant: -5).isActive = true
        labelaverageConsumption.textAlignment = .left
        labelaverageConsumption.text = "Средний расход: " + String(Double(round(10*dataCalc.0)/10)) + " л/100км"
        
        rootView.addSubview(viewPrice)
        viewPrice.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 10).isActive = true
        viewPrice.leadingAnchor.constraint(equalTo: rootView.centerXAnchor, constant: 10).isActive = true
        viewPrice.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        viewPrice.heightAnchor.constraint(equalToConstant: 100).isActive = true
        createCustomView(viewPrice)
        
        viewAverageConsumption.addSubview(labelPrice)
        labelPrice.centerXAnchor.constraint(equalTo: viewPrice.centerXAnchor).isActive = true
        labelPrice.centerYAnchor.constraint(equalTo: viewPrice.centerYAnchor).isActive = true
        labelPrice.leadingAnchor.constraint(equalTo: viewPrice.leadingAnchor, constant: 5).isActive = true
        labelPrice.trailingAnchor.constraint(equalTo: viewPrice.trailingAnchor, constant: -5).isActive = true
        labelPrice.textAlignment = .left
        labelPrice.text = "Потрачено денег на топливо: " + String(dataCalc.1) + " BYN"
        
        rootView.addSubview(viewMileage)
        viewMileage.topAnchor.constraint(equalTo: viewPrice.bottomAnchor, constant: 10).isActive = true
        viewMileage.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        viewMileage.trailingAnchor.constraint(equalTo: rootView.centerXAnchor, constant: -10).isActive = true
        viewMileage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        createCustomView(viewMileage)
        
        viewAverageConsumption.addSubview(labelMileage)
        labelMileage.centerXAnchor.constraint(equalTo: viewMileage.centerXAnchor).isActive = true
        labelMileage.centerYAnchor.constraint(equalTo: viewMileage.centerYAnchor).isActive = true
        labelMileage.leadingAnchor.constraint(equalTo: viewMileage.leadingAnchor, constant: 5).isActive = true
        labelMileage.trailingAnchor.constraint(equalTo: viewMileage.trailingAnchor, constant: -5).isActive = true
        labelMileage.textAlignment = .left
        labelMileage.text = "Общий пробег : " + String(dataCalc.2) + " Km"
        
        rootView.addSubview(viewCountRefueling)
        viewCountRefueling.topAnchor.constraint(equalTo: viewPrice.bottomAnchor, constant: 10).isActive = true
        viewCountRefueling.leadingAnchor.constraint(equalTo: rootView.centerXAnchor, constant: 10).isActive = true
        viewCountRefueling.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        viewCountRefueling.heightAnchor.constraint(equalToConstant: 100).isActive = true
        createCustomView(viewCountRefueling)
        
        viewAverageConsumption.addSubview(labelCountRefueling)
        labelCountRefueling.centerXAnchor.constraint(equalTo: viewCountRefueling.centerXAnchor).isActive = true
        labelCountRefueling.centerYAnchor.constraint(equalTo: viewCountRefueling.centerYAnchor).isActive = true
        labelCountRefueling.leadingAnchor.constraint(equalTo: viewCountRefueling.leadingAnchor, constant: 5).isActive = true
        labelCountRefueling.trailingAnchor.constraint(equalTo: viewCountRefueling.trailingAnchor, constant: -5).isActive = true
        labelCountRefueling.textAlignment = .center
        labelCountRefueling.text = "Всего заправок: " + String(dataCalc.3)
        
        rootView.addSubview(refuelingButton)
        refuelingButton.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        refuelingButton.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        refuelingButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        refuelingButton.topAnchor.constraint(equalTo: viewMileage.bottomAnchor, constant: 20).isActive = true
        
        rootView.addSubview(testButton)
        testButton.leadingAnchor.constraint(equalTo: refuelingButton.leadingAnchor).isActive = true
        testButton.trailingAnchor.constraint(equalTo: refuelingButton.trailingAnchor).isActive = true
        testButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        testButton.topAnchor.constraint(equalTo: refuelingButton.bottomAnchor, constant: 20).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    func refuelingButtonTap(_: UIButton){
        let refuelingVC = RefuelingViewController.init()
        self.navigationController?.pushViewController(refuelingVC, animated: true)
    }
    
    @objc func testButtonTap(_: UIButton) {
        let petrolVisitVC = PetrolStationVisitListViewController()
        self.navigationController?.pushViewController(petrolVisitVC, animated: true)
    }
    


}
