//
//  LoginViewController.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//

import UIKit
import FirebaseAuth
import CoreData

class LoginViewController: UIViewController {
    
    let myColor = UIColor.rgb(red: 113, green: 134, blue: 255)
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.activateConstraint()
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.setPlaceHolderWith(color: .white, text: "Email:")
        emailTextField.activateConstraint()
        emailTextField.text = "khartanovichao@gmail.com"
        emailTextField.autocapitalizationType = .none
        emailTextField.textColor = .white
        emailTextField.indent(size: 20)
        return emailTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.setPlaceHolderWith(color: .white, text: "Password:")
        passwordTextField.activateConstraint()
        passwordTextField.text = "Qwerty123"
        passwordTextField.textColor = .white
        passwordTextField.isSecureTextEntry = true
        passwordTextField.indent(size: 20)
        return passwordTextField
    }()
    
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
        
        loginButton = CustomButton(backgroundColor: myColor, cornerRadius: 20, title: "Login", titleColor: .white, borderWidth: 0, borderColor:.init(red: 0, green: 0, blue: 0, alpha: 0), closure: {
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
        
        signUpButton = CustomButton(backgroundColor: .clear, cornerRadius: 0, title: "Don`t have an account? Sign up", titleColor: .white, borderWidth: 0, borderColor: .init(red: 0, green: 0, blue: 0, alpha: 0), closure: {
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
        emailTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        passwordTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
        
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
        emailTextField.height(constant: 40)
        passwordTextField.height(constant: 40)
        loginButton.height(constant: 40)
        signUpButton.height(constant: 40)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
