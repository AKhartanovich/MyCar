//
//  RefuelingViewController.swift
//  MyCar
//
//  Created by MacBook on 26.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit
import CoreData

class RefuelingViewController: UIViewController, UITextFieldDelegate {
    
    var switchBool: Bool = false
    
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
    
    let priceTextField: UITextField = {
        let priceTextField = UITextField()
        priceTextField.setPlaceHolderWith(color: .rgb(red: 211, green: 211, blue: 211), text: "Price:")
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        return priceTextField
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
    
    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        backButton.layer.cornerRadius = 20
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTap(_:)), for: .touchUpInside)
        return backButton
    }()
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.image = UIImage(named: "Gas.jpg")
        
        view.addSubview(labelInfo)
        labelInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        labelInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelInfo.textColor = .rgb(red: 211, green: 211, blue: 211)
        labelInfo.text = "Refueling"
        labelInfo.font = UIFont.systemFont(ofSize: 20.0)
        labelInfo.textAlignment = .center
        
        view.addSubview(rootView)
        rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
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
        
        rootView.addSubview(priceTextField)
        priceTextField.topAnchor.constraint(equalTo: totalMileageTextField.bottomAnchor, constant: 20).isActive = true
        priceTextField.leadingAnchor.constraint(equalTo: totalMileageTextField.leadingAnchor).isActive = true
        priceTextField.trailingAnchor.constraint(equalTo: totalMileageTextField.trailingAnchor).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        priceTextField.textColor = .white
        createCustomTextField(priceTextField)
        
        rootView.addSubview(fullTankSwitch)
        fullTankSwitch.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 20).isActive = true
        fullTankSwitch.leadingAnchor.constraint(equalTo: priceTextField.leadingAnchor).isActive = true
        fullTankSwitch.onTintColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        fullTankSwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        
        rootView.addSubview(fulTankLable)
        fulTankLable.topAnchor.constraint(equalTo: fullTankSwitch.topAnchor).isActive = true
        fulTankLable.leadingAnchor.constraint(equalTo: fullTankSwitch.trailingAnchor, constant: 20).isActive = true
        fulTankLable.text = "Full tank?"
        fulTankLable.textColor = .white
        fulTankLable.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        
        rootView.addSubview(refuelingButton)
        refuelingButton.leadingAnchor.constraint(equalTo: priceTextField.leadingAnchor).isActive = true
        refuelingButton.trailingAnchor.constraint(equalTo: priceTextField.trailingAnchor).isActive = true
        refuelingButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        refuelingButton.topAnchor.constraint(equalTo: fulTankLable.bottomAnchor, constant: 20).isActive = true
        
        rootView.addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: refuelingButton.leadingAnchor).isActive = true
        backButton.trailingAnchor.constraint(equalTo: refuelingButton.trailingAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.topAnchor.constraint(equalTo: refuelingButton.bottomAnchor, constant: 20).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countOfLitresTextField.delegate = self
        totalMileageTextField.delegate = self
    }
    
    
    @objc
    func backButtonTap(_: UIButton){
        if let viewControllers = self.navigationController?.viewControllers {
            for vc in viewControllers {
                if vc is GasolineViewController {
                    vc.modalPresentationStyle = .fullScreen
                    vc.viewDidLoad()
                    HomeViewController.init().loadView()
                    GasolineViewController.init().loadView()
                    _ = self.navigationController?.popToViewController(vc,animated: true)
                    return
                }
            }
            self.navigationController?.pushViewController(GasolineViewController.init(), animated: true)
        }
    }
    
        @objc
        func refuelingButtonTap(_: UIButton){
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            //context
            let context = appDelegate.persistentContainer.viewContext
            //Entity
            guard let entityUsers = NSEntityDescription.entity(forEntityName: "Users", in: context) else {return}
            guard let entityRefueling = NSEntityDescription.entity(forEntityName: "Refueling", in: context) else {return}

            guard let countOfLitres = countOfLitresTextField.text else {return}
            guard let totalMileage = totalMileageTextField.text else {return}
            guard let price = priceTextField.text else {return}
            guard let countOfLitresDouble = Double(countOfLitres) else {return}
            guard let totalMileageDouble = Double(totalMileage) else {return}
            guard let priceDouble = Double(price) else {return}
            
            //Здесь создаются экземпляры классов кордаты
            let person = Users(entity: entityUsers, insertInto: context)
            person.email = Person.instance.email
            person.name = Person.instance.name
            person.surname = Person.instance.surname
            person.uuid = Person.instance.UUID

            let refueling = Refueling(entity: entityRefueling, insertInto: context)
            refueling.fullTank = switchBool
            refueling.literes = countOfLitresDouble
            refueling.totalMileage = totalMileageDouble
            refueling.price = priceDouble
            //Данной строкой реализована связь один к многим, те пользователь может иметь много заправок
            //но заправка имеет только одного пользователя
            refueling.users = person
            do {
                try context.save()
            } catch let error as NSError {
                print("\(error), \(error.userInfo)")
            }
            countOfLitresTextField.text = ""
            totalMileageTextField.text = ""
            priceTextField.text = ""
        }
    
    
    //функция запрещает ввод символов в текстфилд
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For numers
        if textField == countOfLitresTextField || textField == totalMileageTextField {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch){
        if (sender.isOn == true){
            switchBool = true
        }
        else{
            switchBool = false
        }
    }

}
