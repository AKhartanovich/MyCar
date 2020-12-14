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
    var dataCalc: DataGasolineFromCoreData = DataCorteg(dataFromCoreData: (0,0,0,0))
    
    let stackViewWithLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.activateConstraint()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 110
        return stackView
    }()
    
    let stackViewWithButtoms: UIStackView = {
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
    
    let labelInfo: UILabel = {
       let label = UILabel()
        label.activateConstraint()
        return label
    }()
    
    let view1InStack: UIView = {
        let view = UIView()
        view.activateConstraint()
        return view
    }()
    
    let view2InStack: UIView = {
        let view = UIView()
        view.activateConstraint()
        return view
    }()
    let labelaverageConsumption: PaddingLabel = PaddingLabel(withInsets: 5, 5, 10, 10)
    let labelPrice: PaddingLabel = PaddingLabel(withInsets: 5, 5, 10, 10)
    let labelMileage: PaddingLabel = PaddingLabel(withInsets: 5, 5, 10, 10)
    let labelCountRefueling: PaddingLabel = PaddingLabel(withInsets: 5, 5, 10, 10)
    
    var refuelingButton: CustomButton!
    var listButton: CustomButton!
    
    override func loadView() {
        super.loadView()
        refuelingButton = CustomButton(backgroundColor: .rgb(red: 113, green: 134, blue: 255), cornerRadius: 20, title: "Refueling", titleColor: .white, closure: {
            let refuelingVC = RefuelingViewController.init()
            self.navigationController?.pushViewController(refuelingVC, animated: true)
            self.navigationController?.navigationBar.isHidden = false
        })
        listButton = CustomButton(backgroundColor: .rgb(red: 113, green: 134, blue: 255), cornerRadius: 20, title: "Refueling list", titleColor: .white) {
            let petrolVisitVC = PetrolStationVisitListViewController()
            self.navigationController?.pushViewController(petrolVisitVC, animated: true)
            self.navigationController?.navigationBar.isHidden = false
        }
        labelaverageConsumption.createLableGasoline(textColor: .white, numberOfLines: 4, textAlignment: .left)
        labelPrice.createLableGasoline(textColor: .white, numberOfLines: 4, textAlignment: .left)
        labelMileage.createLableGasoline(textColor: .white, numberOfLines: 4, textAlignment: .left)
        labelCountRefueling.createLableGasoline(textColor: .white, numberOfLines: 4, textAlignment: .left)
        createLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataCalc = DataCorteg(dataFromCoreData: calculateAverageConsumption())
        createLayout()
    }
    
    func createLayout(){
        view.addSubview(imageView)
        imageView.fillSuperView()
        imageView.image = UIImage(named: ".jpg")
        
        view.addSubview(labelInfo)
        labelInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        labelInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelInfo.textColor = .rgb(red: 211, green: 211, blue: 211)
        labelInfo.text = "Refueling"
        labelInfo.font = UIFont.systemFont(ofSize: 20.0)
        labelInfo.textAlignment = .center
        labelInfo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(stackViewWithButtoms)
        stackViewWithButtoms.bottom(equalTo: view.bottomAnchor, constant: -100)
        stackViewWithButtoms.leading(equalTo: view.leadingAnchor, constant: 40)
        stackViewWithButtoms.trailing(equalTo: view.trailingAnchor, constant: -40)
        stackViewWithButtoms.addArrangedSubview(refuelingButton)
        refuelingButton.height(constant: 40)
        stackViewWithButtoms.addArrangedSubview(listButton)
        listButton.height(constant: 40)
        
        view.addSubview(stackViewWithLabel)
        stackViewWithLabel.bottom(equalTo: stackViewWithButtoms.topAnchor, constant: -110)
        stackViewWithLabel.leading(equalTo: view.leadingAnchor, constant: 20)
        stackViewWithLabel.trailing(equalTo: view.trailingAnchor, constant: -20)
        stackViewWithLabel.addArrangedSubview(view1InStack)
        stackViewWithLabel.addArrangedSubview(view2InStack)
        
        view1InStack.addSubview(labelaverageConsumption)
        labelaverageConsumption.leading(equalTo: view1InStack.leadingAnchor)
        labelaverageConsumption.trailing(equalTo: view1InStack.centerXAnchor, constant: -10)
        labelaverageConsumption.top(equalTo: view1InStack.topAnchor)
        labelaverageConsumption.height(constant: 100)
        labelaverageConsumption.text = "Средний расход: " + String(Double(round(10*dataCalc.dataFromCoreData.0)/10)) + " л/100км"
        labelaverageConsumption.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        view1InStack.addSubview(labelPrice)
        labelPrice.leading(equalTo: view1InStack.centerXAnchor, constant: 10)
        labelPrice.trailing(equalTo: view1InStack.trailingAnchor)
        labelPrice.top(equalTo: view1InStack.topAnchor)
        labelPrice.height(constant: 100)
        labelPrice.text = "Потрачено денег на топливо: " + String(dataCalc.dataFromCoreData.1) + " BYN"
        labelPrice.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        
        view2InStack.addSubview(labelMileage)
        labelMileage.leading(equalTo: view2InStack.leadingAnchor)
        labelMileage.trailing(equalTo: view2InStack.centerXAnchor, constant: -10)
        labelMileage.top(equalTo: view2InStack.topAnchor)
        labelMileage.height(constant: 100)
        labelMileage.text = "Общий пробег : " + String(dataCalc.dataFromCoreData.2) + " Km"
        labelMileage.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        view2InStack.addSubview(labelCountRefueling)
        labelCountRefueling.leading(equalTo: view2InStack.centerXAnchor, constant: 10)
        labelCountRefueling.trailing(equalTo: view2InStack.trailingAnchor)
        labelCountRefueling.top(equalTo: view2InStack.topAnchor)
        labelCountRefueling.height(constant: 100)
        labelCountRefueling.text = "Всего заправок: " + String(dataCalc.dataFromCoreData.3)
        labelCountRefueling.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
    }
    
}



