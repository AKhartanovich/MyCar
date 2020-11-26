//
//  PersonInfoClass.swift
//  MyCar
//
//  Created by MacBook on 25.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

class Person {
    var UUID: String
    var email: String
    var name: String
    var surname: String
    
    static let instance = Person()
    
    private init() {
        self.UUID = ""
        self.email = ""
        self.name = ""
        self.surname = ""
    }
    
    static func createWith(userName: String, UUID: String, name: String, surname: String){
        Person.instance.UUID = UUID
        Person.instance.email = userName
        Person.instance.name = name
        Person.instance.surname = surname
    }
}
