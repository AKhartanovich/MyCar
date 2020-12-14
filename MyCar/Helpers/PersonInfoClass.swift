//
//  PersonInfoClass.swift
//  MyCar
//
//  Created by MacBook on 25.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit


///Синнгтон для хранения данных пользователя и доступа к ним из всех классов
class UserDataManager {
    var UUID: String
    var email: String
    var name: String
    var surname: String
    
    static let instance = UserDataManager()
    
    private init() {
        self.UUID = ""
        self.email = ""
        self.name = ""
        self.surname = ""
    }
    
    static func createWith(userName: String, UUID: String, name: String, surname: String){
        UserDataManager.instance.UUID = UUID
        UserDataManager.instance.email = userName
        UserDataManager.instance.name = name
        UserDataManager.instance.surname = surname
    }
}
