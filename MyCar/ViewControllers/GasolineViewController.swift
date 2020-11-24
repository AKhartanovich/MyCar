//
//  GasolineViewController.swift
//  MyCar
//
//  Created by MacBook on 24.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

class GasolineViewController: UIViewController, UITextFieldDelegate {
    
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
    
    let countOfLitresTextField: UITextField = {
        let countOfLitresTextField = UITextField()
        countOfLitresTextField.setPlaceHolderWith(color: .rgb(red: 211, green: 211, blue: 211), text: "Count of fuel:")
        countOfLitresTextField.translatesAutoresizingMaskIntoConstraints = false
        return countOfLitresTextField
    }()
    
    let totalMileageTextField: UITextField = {
        let totalMileage = UITextField()
        totalMileage.setPlaceHolderWith(color: .rgb(red: 211, green: 211, blue: 211), text: "Total mileage:")
        totalMileage.translatesAutoresizingMaskIntoConstraints = false
        return totalMileage
    }()
    
    let fullTankSwitch: UISwitch = {
        let fullTank = UISwitch()
        fullTank.translatesAutoresizingMaskIntoConstraints = false
        return fullTank
    }()
    
    let fulTankLable: UILabel = {
        let fullTank = UILabel()
        fullTank.translatesAutoresizingMaskIntoConstraints = false
        return fullTank
    }()
    
    let dateTextField: CustomTextField = {
        let dateTextField = CustomTextField()
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        return dateTextField
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
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.image = UIImage(named: "gasstation.jpg")
        
        view.addSubview(rootView)
        rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        rootView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        rootView.addSubview(countOfLitresTextField)
        countOfLitresTextField.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 10).isActive = true
        countOfLitresTextField.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        countOfLitresTextField.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        countOfLitresTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        countOfLitresTextField.textColor = .white
        createCustomTextField(countOfLitresTextField)
        
        rootView.addSubview(totalMileageTextField)
        totalMileageTextField.topAnchor.constraint(equalTo: countOfLitresTextField.bottomAnchor, constant: 20).isActive = true
        totalMileageTextField.leadingAnchor.constraint(equalTo: countOfLitresTextField.leadingAnchor).isActive = true
        totalMileageTextField.trailingAnchor.constraint(equalTo: countOfLitresTextField.trailingAnchor).isActive = true
        totalMileageTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        totalMileageTextField.textColor = .white
        createCustomTextField(totalMileageTextField)
        
        rootView.addSubview(fullTankSwitch)
        fullTankSwitch.topAnchor.constraint(equalTo: totalMileageTextField.bottomAnchor, constant: 20).isActive = true
        fullTankSwitch.leadingAnchor.constraint(equalTo: totalMileageTextField.leadingAnchor).isActive = true
        fullTankSwitch.onTintColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        fullTankSwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        
        rootView.addSubview(fulTankLable)
        fulTankLable.topAnchor.constraint(equalTo: fullTankSwitch.topAnchor).isActive = true
        fulTankLable.leadingAnchor.constraint(equalTo: fullTankSwitch.trailingAnchor, constant: 20).isActive = true
        fulTankLable.text = "Full tank?"
        fulTankLable.textColor = .white
        fulTankLable.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        
        rootView.addSubview(dateTextField)
        dateTextField.topAnchor.constraint(equalTo: fullTankSwitch.bottomAnchor, constant: 20).isActive = true
        dateTextField.leadingAnchor.constraint(equalTo: fullTankSwitch.leadingAnchor).isActive = true
        dateTextField.trailingAnchor.constraint(equalTo: totalMileageTextField.trailingAnchor).isActive = true
        dateTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dateTextField.textColor = .white
        dateTextField.setPlaceHolderWith(color: .white, text: "Refueling date")
        createCustomTextField(dateTextField)
        
        rootView.addSubview(refuelingButton)
        refuelingButton.leadingAnchor.constraint(equalTo: dateTextField.leadingAnchor).isActive = true
        refuelingButton.trailingAnchor.constraint(equalTo: dateTextField.trailingAnchor).isActive = true
        refuelingButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        refuelingButton.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 20).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        countOfLitresTextField.delegate = self
        totalMileageTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For numers
        if textField == countOfLitresTextField || textField == totalMileageTextField {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    var switchBool: Bool = false
    
    @objc
    func refuelingButtonTap(_: UIButton){
        guard let countOfLitres = countOfLitresTextField.text else {return}
        guard let totalMileage = totalMileageTextField.text else {return}
        guard let date = dateTextField.text else {return}
        
        guard let countOfLitresDouble = Double(countOfLitres) else {return}
        guard let totalMileageDouble = Double(totalMileage) else {return}
        
        let myRefueling = Refueling(countOfLitres: countOfLitresDouble, totalMileage: totalMileageDouble, fullTank: switchBool, date: date)
        
        let myGasStation = GasStation(refueling: myRefueling)
        
        fulTankLable.text = String(myGasStation.countOfRefueling())
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch){
        if (sender.isOn == true){
            switchBool = false
        }
        else{
            switchBool = true
        }
    }


}
