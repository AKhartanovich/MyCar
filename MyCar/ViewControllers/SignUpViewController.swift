//
//  SignUpViewController.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//

import UIKit
import FirebaseAuth
import CoreData

class SignUpViewController: UIViewController {
    
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
    
    let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.setPlaceHolderWith(color: .white, text: "Email:")
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.setPlaceHolderWith(color: .white, text: "Name:")
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()
    
    let surnameTextField: UITextField = {
        let surnameTextField = UITextField()
        surnameTextField.setPlaceHolderWith(color: .white, text: "Surname:")
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        return surnameTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.setPlaceHolderWith(color: .white, text: "Password:")
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    let passwordRepeatTextField: UITextField = {
        let passwordRepeatTextField = UITextField()
        passwordRepeatTextField.setPlaceHolderWith(color: .white, text: "Repeat password:")
        passwordRepeatTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordRepeatTextField
    }()
    
    let errorLable: UILabel = {
        let errorLable = UILabel()
        errorLable.translatesAutoresizingMaskIntoConstraints = false
        errorLable.text = "error"
        errorLable.textColor = .red
        return errorLable
    }()
    
    let signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.backgroundColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        signUpButton.layer.cornerRadius = 20
        signUpButton.alpha = 0.8
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTap(_:)), for: .touchUpInside)
        return signUpButton
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Have an account? Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTap(_:)), for: .touchUpInside)
        return loginButton
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.image = UIImage(named: "home.jpg")
        
        view.addSubview(rootView)
        rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        rootView.addSubview(emailTextField)
        emailTextField.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 10).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.autocapitalizationType = .none
        emailTextField.text = "khartanovichao@gmail.com"
        emailTextField.textColor = .white
        createCustomTextField(emailTextField)
        
        rootView.addSubview(nameTextField)
        nameTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextField.autocapitalizationType = .none
        nameTextField.text = "Alexander"
        nameTextField.textColor = .white
        createCustomTextField(nameTextField)
        
        rootView.addSubview(surnameTextField)
        surnameTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        surnameTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        surnameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        surnameTextField.autocapitalizationType = .none
        surnameTextField.text = "Khartanovich"
        surnameTextField.textColor = .white
        createCustomTextField(surnameTextField)
        
        rootView.addSubview(passwordTextField)
        passwordTextField.leadingAnchor.constraint(equalTo: surnameTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: surnameTextField.trailingAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.autocapitalizationType = .none
        passwordTextField.textColor = .white
        passwordTextField.text = "Qwerty123"
        passwordTextField.isSecureTextEntry = true
        createCustomTextField(passwordTextField)
        
        rootView.addSubview(passwordRepeatTextField)
        passwordRepeatTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        passwordRepeatTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        passwordRepeatTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        passwordRepeatTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordRepeatTextField.autocapitalizationType = .none
        passwordRepeatTextField.textColor = .white
        passwordRepeatTextField.text = "Qwerty123"
        passwordRepeatTextField.isSecureTextEntry = true
        createCustomTextField(passwordRepeatTextField)
        
        rootView.addSubview(signUpButton)
        signUpButton.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signUpButton.topAnchor.constraint(equalTo: passwordRepeatTextField.bottomAnchor, constant: 10).isActive = true
        
        rootView.addSubview(loginButton)
        loginButton.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 10).isActive = true
        
        rootView.addSubview(errorLable)
        errorLable.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        errorLable.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        errorLable.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: 20).isActive = true
        errorLable.alpha = 0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func signUpButtonTap(_: UIButton){
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let repeatPassword = passwordRepeatTextField.text,
              let name = nameTextField.text,
              let surname = surnameTextField.text else {return}
        guard !email.isEmpty else { errorLable.alpha = 1; errorLable.text = "Insert Email"; return}
        guard !password.isEmpty else {errorLable.alpha = 1; errorLable.text = "Insert Password" ; return}
        guard !repeatPassword.isEmpty else {errorLable.alpha = 1; errorLable.text = "Repeat Password"; return}
        guard validEmailId(inputText: email) else {errorLable.alpha = 1; errorLable.text = "Email format error"; return}
        guard password == repeatPassword else {errorLable.alpha = 1; errorLable.text = "Введите одинокавые пароли"; return}
        guard validPassword(inputPassword: password) else {errorLable.alpha = 1; errorLable.text = "Пароль должен содержать буквы большого регистра, цифры и не менее 8 символов"
            passwordTextField.text = ""
            passwordRepeatTextField.text = ""
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            if err != nil {
                self.errorLable.alpha = 1
                self.errorLable.text = "Error creating user"
            } else {
                guard let result = result else {return}
                self.createData(name: name, surname: surname, UUID: result.user.uid, email: email)
//                let person = Person(UUID: result.user.uid, username: email)
                Person.createWith(userName: email, UUID: result.user.uid, name: name, surname: surname)
                print("\(Person.instance.UUID), \(Person.instance.email), \(Person.instance.name), \(Person.instance.surname)")
                let HomeTBC = RootTabBarController.init()
                HomeTBC.modalPresentationStyle = .fullScreen
                self.navigationController?.present(HomeTBC, animated: true, completion: .none)
            }
            
        }
    }
    
    func createData(name: String, surname: String, UUID: String, email: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        //context
        let context = appDelegate.persistentContainer.viewContext
        //Entity
        guard let entity = NSEntityDescription.entity(forEntityName: "Users", in: context) else {return}
        let user = Users(entity: entity, insertInto: context)
        user.email = email
        user.name = name
        user.surname = surname
        user.uuid = UUID
        do {
            try context.save()
        } catch let error as NSError {
            print("\(error), \(error.userInfo)")
        }
    }
    
    @objc func loginButtonTap(_: UIButton){
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
    }
}



