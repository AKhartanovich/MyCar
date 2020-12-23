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
    
    let myColor = UIColor.rgb(red: 113, green: 134, blue: 255)
    
    var switchBool: Bool = false
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.activateConstraint()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let labelInfo: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        return label
    }()
    
    let tankView: UIView = {
       let tankView = UIView()
        tankView.translatesAutoresizingMaskIntoConstraints = false
        return tankView
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
        imageView.fillSuperView()
        imageView.image = UIImage(named: "i.jpg")
        
        tankView.addSubview(fullTankSwitch)
        fullTankSwitch.top(equalTo: tankView.topAnchor)
        fullTankSwitch.bottom(equalTo: tankView.bottomAnchor)
        fullTankSwitch.leading(equalTo: tankView.leadingAnchor)
        tankView.addSubview(fulTankLable)
        fulTankLable.top(equalTo: fullTankSwitch.topAnchor)
        fulTankLable.leading(equalTo: fullTankSwitch.trailingAnchor)
        fulTankLable.trailing(equalTo: tankView.trailingAnchor)
        
        view.addSubview(stackView)
        stackView.bottom(equalTo: view.bottomAnchor, constant: -100)
        stackView.leading(equalTo: view.leadingAnchor, constant: 10)
        stackView.trailing(equalTo: view.trailingAnchor, constant: -10)
        stackView.addArrangedSubview(countOfLitresTextField)
        countOfLitresTextField.height(constant: 40)
        countOfLitresTextField.textColor = .white
        countOfLitresTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        countOfLitresTextField.indent(size: 20)
        stackView.addArrangedSubview(totalMileageTextField)
        totalMileageTextField.height(constant: 40)
        totalMileageTextField.textColor = .white
        totalMileageTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        totalMileageTextField.indent(size: 20)
        stackView.addArrangedSubview(priceTextField)
        priceTextField.height(constant: 40)
        priceTextField.textColor = .white
        priceTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        priceTextField.indent(size: 20)
        stackView.addArrangedSubview(tankView)
        fullTankSwitch.onTintColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        fullTankSwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        fulTankLable.text = "Full tank?"
        fulTankLable.textColor = .white
        stackView.addArrangedSubview(refuelingButton)
        refuelingButton.height(constant: 40)
        stackView.addArrangedSubview(backButton)
        backButton.height(constant: 40)
        
        
        view.addSubview(labelInfo)
        labelInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        labelInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelInfo.textColor = .rgb(red: 211, green: 211, blue: 211)
        labelInfo.text = "Refueling"
        labelInfo.font = UIFont.systemFont(ofSize: 20.0)
        labelInfo.textAlignment = .center
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.moveViewDownUp()
        countOfLitresTextField.delegate = self
        totalMileageTextField.delegate = self
        priceTextField.delegate = self
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
            person.email = UserDataManager.instance.email
            person.name = UserDataManager.instance.name
            person.surname = UserDataManager.instance.surname
            person.uuid = UserDataManager.instance.UUID

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
