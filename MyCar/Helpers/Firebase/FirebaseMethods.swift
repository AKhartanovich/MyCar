//
//  FirebaseMethods.swift
//  MyCar
//
//  Created by MacBook on 8.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import CoreData


///Авторизация в Firebase
func authInFireBaseWith(email: String, password: String, vc: UIViewController, closure:@escaping () -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { [vc] (result, error) in
        if let error = error {
            vc.showAlert(userTitle: "Error", userMessage: error.localizedDescription)
        } else {
            let res = retrieveDataFromCoreDataAboutUser(email: email, entityName: "Users", format: "ANY email = %@")
            guard let result = result else {return}
            guard let dataInCoreData = res else {return}
            do {
                for data in dataInCoreData as! [NSManagedObject] {
                    let name = data.value(forKey: "name") as! String
                    let surname = data.value(forKey: "surname") as! String
                    UserDataManager.createWith(userName: email, UUID: result.user.uid, name: name, surname: surname)
                }
            }
            closure()
        }
    }
}

///Регистрация в Firebase
func createUserInFirebaseWith(email: String, password: String, name: String, surname: String, vc: UIViewController, closure:@escaping () -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
        if err != nil {
            vc.showAlert(userTitle: "Error", userMessage: err!.localizedDescription)
        } else {
            guard let result = result else {return}
            //создание пользователя в таблице
//                createData(name: name, surname: surname, UUID: result.user.uid, email: email)
            createDataFor(entity: "Users", name: name, surname: surname, UUID: result.user.uid, email: email)
            UserDataManager.createWith(userName: email, UUID: result.user.uid, name: name, surname: surname)
//            print("\(UserDataManager.instance.UUID), \(UserDataManager.instance.email), \(UserDataManager.instance.name), \(UserDataManager.instance.surname)")
            closure()
//            let HomeTBC = RootTabBarController.init()
//            HomeTBC.modalPresentationStyle = .fullScreen
//            vc.navigationController?.present(HomeTBC, animated: true, completion: .none)
        }
        
    }
}


