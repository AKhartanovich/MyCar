//  SignUpViewController.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//

import UIKit
import AuthenticationServices
import CoreData

class SignUpViewController: UIViewController {
    
    let myColor = UIColor.rgb(red: 113, green: 134, blue: 255)
    
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
    
    var emailTextField: CustomTextField!
    
    var nameTextField: CustomTextField!

    var surnameTextField:CustomTextField!

    var passwordTextField: CustomTextField!

    var passwordRepeatTextField: CustomTextField!

    var signUpButton: CustomButton!

    var loginButton: CustomButton!

    
    override func loadView() {
        super.loadView()
        
        view.addSubview(imageView)
        imageView.fillSuperView()
        imageView.image = UIImage(named: "home.jpg")
        createSignUpButton()
        createLoginButton()
        createEmailTextField()
        createNameTextField()
        createSurnameTextField()
        createPasswordTextField()
        createPasswordRepeatTextField()
        
        view.addSubview(stackView)
        stackView.bottom(equalTo: view.bottomAnchor, constant: -40)
        stackView.leading(equalTo: view.leadingAnchor, constant: 40)
        stackView.trailing(equalTo: view.trailingAnchor, constant: -40)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surnameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(passwordRepeatTextField)
        stackView.addArrangedSubview(signUpButton)
        stackView.addArrangedSubview(loginButton)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.moveViewDownUp()
    }
    func createEmailTextField (){
        emailTextField = CustomTextField(placeHolderColor: .white, placeholderText: "Email:", text: "khartanovichao@gmail.com", textColor: .white, indentSize: 20)
        emailTextField.height(constant: 40)
        emailTextField.autocapitalizationType = .none
        emailTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
    }
    func createNameTextField(){
        nameTextField = CustomTextField(placeHolderColor: .white, placeholderText: "Name:", text: "Alexander", textColor: .white, indentSize: 20)
        nameTextField.autocapitalizationType = .none
        nameTextField.height(constant: 40)
        nameTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
    }
    func createSurnameTextField() {
        surnameTextField = CustomTextField(placeHolderColor: .white, placeholderText: "Surname:", text: "Khartanovich", textColor: .white, indentSize: 20)
        surnameTextField.autocapitalizationType = .none
        surnameTextField.height(constant: 40)
        surnameTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
    }
    func createPasswordTextField() {
        passwordTextField = CustomTextField(placeHolderColor: .white, placeholderText: "Password:", text: "Qwerty123", textColor: .white, indentSize: 20)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.height(constant: 40)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
    }
    func createPasswordRepeatTextField() {
        passwordRepeatTextField = CustomTextField(placeHolderColor: .white, placeholderText: "Password:", text: "Qwerty123", textColor: .white, indentSize: 20)
        passwordRepeatTextField.autocapitalizationType = .none
        passwordRepeatTextField.height(constant: 40)
        passwordRepeatTextField.isSecureTextEntry = true
        passwordRepeatTextField.createCustomViewWith(borderWidth: 1.3, borderColor: myColor.cgColor, cornerRadius: 20)
    }
    
    func createSignUpButton(){
        signUpButton = CustomButton(backgroundColor: .rgb(red: 113, green: 134, blue: 255), cornerRadius: 20, title: "Sign up", titleColor: .white, closure: {
            guard let email = self.emailTextField.text,
                  let password = self.passwordTextField.text,
                  let repeatPassword = self.passwordRepeatTextField.text,
                  let name = self.nameTextField.text,
                  let surname = self.surnameTextField.text else {return}
            guard !email.isEmpty else { self.showAlert(userTitle: "Error", userMessage: "Insert Email"); return}
            guard !password.isEmpty else {self.showAlert(userTitle: "Error", userMessage: "Insert Password"); return}
            guard !repeatPassword.isEmpty else {self.showAlert(userTitle: "Error", userMessage: "Repeat Password"); return}
            guard validEmailId(inputText: email) else {self.showAlert(userTitle: "Error", userMessage: "Email format error"); return}
            guard password == repeatPassword else {self.showAlert(userTitle: "Error", userMessage: "Введите одинокавые пароли"); return}
            guard validPassword(inputPassword: password) else {self.showAlert(userTitle: "Error", userMessage: "Пароль должен содержать буквы большого регистра, цифры и не менее 8 символов")
                self.passwordTextField.text = ""
                self.passwordRepeatTextField.text = ""
                return
            }
            createUserInFirebaseWith(email: email, password: password, name: name, surname: surname, vc: self) {
                let HomeTBC = RootTabBarController.init()
                HomeTBC.modalPresentationStyle = .fullScreen
                self.navigationController?.present(HomeTBC, animated: true, completion: .none)
            }
        })
        signUpButton.height(constant: 40)
    }
    
    func createLoginButton(){
        loginButton = CustomButton(title: "Have an account? Login", titleColor: .white, closure: {
            if let viewControllers = self.navigationController?.viewControllers {
                for vc in viewControllers {
                    if vc is LoginViewController {
                        vc.modalPresentationStyle = .fullScreen
                        _ = self.navigationController?.popToViewController(vc,animated: true)
                        return
                    }
                }
                self.navigationController?.pushViewController(LoginViewController.init(), animated: true)
            }
        })
        loginButton.height(constant: 40)
    }
}



