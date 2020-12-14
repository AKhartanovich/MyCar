//
//  LoginViewController.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//

import UIKit
import AuthenticationServices
import CoreData

class LoginViewController: UIViewController {
    
    let myColor = UIColor.rgb(red: 113, green: 134, blue: 255)
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.activateConstraint()
        return imageView
    }()
    
    var emailTextField: CustomTextField!
    var passwordTextField: CustomTextField!
    
    var loginButton: CustomButton!
    var signUpButton: CustomButton!
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.activateConstraint()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    override func loadView() {
        super.loadView()
        createEmailTextField()
        createPasswordTextField()
        createLoginButton()
        createSignUpButton()
        
        view.addSubview(imageView)
        imageView.fillSuperView()
        imageView.image = UIImage(named: "home.jpg")
        
        view.addSubview(stackView)
        stackView.leading(equalTo: view.leadingAnchor, constant: 40)
        stackView.trailing(equalTo: view.trailingAnchor, constant: -40)
        stackView.bottom(equalTo: view.bottomAnchor, constant: -40)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(signUpButton)
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createSignUpButton() {
        signUpButton = CustomButton(title: "Don`t have an account? Sign up", titleColor: .white, closure: {
            if let viewControllers = self.navigationController?.viewControllers {
                for vc in viewControllers {
                    if vc is SignUpViewController {
                        vc.modalPresentationStyle = .fullScreen
                        _ = self.navigationController?.popToViewController(vc,animated: true)
                        return
                    }
                }
                self.navigationController?.pushViewController(SignUpViewController.init(), animated: true)
            }
        })
        signUpButton.height(constant: 40)
    }
    func createLoginButton () {
        loginButton = CustomButton(backgroundColor: myColor, cornerRadius: 20, title: "Login", titleColor: .white, closure: {
            guard let email = self.emailTextField.text else {return}
            guard let password = self.passwordTextField.text else {return}
            authInFireBaseWith(email: email, password: password, vc: self) {
                let HomeTBC = RootTabBarController.init()
                HomeTBC.modalPresentationStyle = .fullScreen
                self.navigationController?.present(HomeTBC, animated: true, completion: .none)
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
                self.navigationController?.navigationBar.shadowImage = UIImage()
                self.navigationController?.navigationBar.isTranslucent = true
                self.navigationController?.view.backgroundColor = UIColor.clear
            }
        })
        loginButton.height(constant: 40)
    }
    func createEmailTextField() {
        emailTextField = CustomTextField(placeHolderColor: .white, placeholderText: "Email:", text: "khartanovichao@gmail.com", textColor: .white, indentSize: 20)
        emailTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        emailTextField.height(constant: 40)
    }
    func createPasswordTextField() {
        passwordTextField = CustomTextField(placeHolderColor: .white, placeholderText: "Password:", text: "Qwerty123", textColor: .white, indentSize: 20)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .always
        passwordTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        passwordTextField.height(constant: 40)
    }
}
