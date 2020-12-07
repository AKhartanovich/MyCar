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
        emailTextField.text = "khartanovichao@gmail.com"
        return emailTextField
    }()
    
    let passwordTextField: UITextField = {
    let passwordTextField = UITextField()
        passwordTextField.setPlaceHolderWith(color: .white, text: "Password:")
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.text = "Qwerty123"
        return passwordTextField
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = UIColor.rgb(red: 113, green: 134, blue: 255)
        loginButton.layer.cornerRadius = 20
        loginButton.alpha = 0.8
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTap(_:)), for: .touchUpInside)
        return loginButton
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
        signUpButton.setTitle("Don`t have an account? Sign up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTap(_:)), for: .touchUpInside)
        return signUpButton
    }()

    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
//        for i in 0 ..< 10 {
//            //As we know that container is set up in the AppDelegates so we need to refer that container.
//            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//            //We need to create a context from this container
//            let context = appDelegate.persistentContainer.viewContext
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
////            request.predicate = NSPredicate(format: "email = %@", "khartanovichao@gmail.com")
//            do
//           {
//            let test = try context.fetch(request)
//            let objectToDelete = test[0] as! NSManagedObject
//            context.delete(objectToDelete)
//            do{
//                try context.save()
//            }
//            catch {
//                print(error)
//            }
//           } catch {
//            print(error)
//           }
//        }
        
        view.addSubview(imageView)
        imageView.fillSuperView()
        imageView.image = UIImage(named: "home.jpg")
        
        
        view.addSubview(rootView)
        rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        rootView.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 40).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.autocapitalizationType = .none
        emailTextField.textColor = .white
        createCustomTextField(emailTextField)
        
        rootView.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.textColor = .white
        passwordTextField.isSecureTextEntry = true
        createCustomTextField(passwordTextField)
        
        rootView.addSubview(loginButton)
        loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        
        rootView.addSubview(signUpButton)
        signUpButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        
        rootView.addSubview(errorLable)
        errorLable.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        errorLable.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 10).isActive = true
        errorLable.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: 20).isActive = true
        errorLable.leadingAnchor.constraint(equalTo: signUpButton.leadingAnchor).isActive = true
        errorLable.trailingAnchor.constraint(equalTo: signUpButton.trailingAnchor).isActive = true
        errorLable.numberOfLines = 5
        errorLable.alpha = 0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func loginButtonTap(_: UIButton) {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        //Авторизация в Google firebase
        Auth.auth().signIn(withEmail: email, password: password) { [self] (result, error) in
            if let error = error {
                self.errorLable.alpha = 1
                self.errorLable.text = error.localizedDescription
            } else {
                guard let result = result else {return}
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
                let context = appDelegate.persistentContainer.viewContext
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
                request.predicate = NSPredicate(format: "ANY email = %@", email)
                do {
                    let res = try context.fetch(request)
                    for data in res as! [NSManagedObject] {
                        let name = data.value(forKey: "name") as! String
                        let surname = data.value(forKey: "surname") as! String
                        Person.createWith(userName: email, UUID: result.user.uid, name: name, surname: surname)
                    }
                } catch let error as NSError {
                    print(error)
                }
                let HomeTBC = RootTabBarController.init()
                HomeTBC.modalPresentationStyle = .fullScreen
                self.navigationController?.present(HomeTBC, animated: true, completion: .none)
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
                self.navigationController?.navigationBar.shadowImage = UIImage()
                self.navigationController?.navigationBar.isTranslucent = true
                self.navigationController?.view.backgroundColor = UIColor.clear
            }
        }
    }
    
    @objc func signUpButtonTap(_: UIButton){
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
    }
}
