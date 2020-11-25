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
    var userName: String
    
    static let instance = Person()
    
    private init() {
        self.UUID = ""
        self.userName = ""
    }
    
    static func createWith(userName: String, UUID: String){
        Person.instance.UUID = UUID
        Person.instance.userName = userName
    }
}
