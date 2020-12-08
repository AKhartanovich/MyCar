//
//  StartUpViewController.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//
import UIKit

class StartUpViewController: UIViewController {
    
    var signUpButton: CustomButton!
    var loginButton: CustomButton!
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.activateConstraint()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    override func loadView() {
        super.loadView()
        createsignUpButton()
        createloginButton()
        setUpVideo(view: view, resourse: "Preview", type: "mp4")
        
        view.addSubview(stackView)
        
        stackView.leading(equalTo: view.leadingAnchor, constant: 40)
        stackView.trailing(equalTo: view.trailingAnchor, constant: -40)
        stackView.bottom(equalTo: view.bottomAnchor, constant: -40)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(signUpButton)
        loginButton.height(constant: 40)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createsignUpButton() {
        signUpButton = CustomButton(backgroundColor: .rgb(red: 113, green: 134, blue: 255), cornerRadius: 20, title: "Sign up") {
            self.navigationController?.pushViewController(SignUpViewController.init(), animated: true)
        }
        signUpButton.height(constant: 40)
    }
    
    func createloginButton() {
    loginButton = CustomButton(cornerRadius: 20, title: "Login", titleColor: .white, borderWidth: 1.3, borderColor: UIColor.rgb(red: 113, green: 134, blue: 255).cgColor, closure: {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    })
    }
    
}
