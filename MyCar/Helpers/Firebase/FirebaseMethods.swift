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
                    Person.createWith(userName: email, UUID: result.user.uid, name: name, surname: surname)
                }
            }
            closure()
        }
    }
}
