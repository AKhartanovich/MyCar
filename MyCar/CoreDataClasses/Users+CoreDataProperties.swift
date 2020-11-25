//
//  Users+CoreDataProperties.swift
//  MyCar
//
//  Created by MacBook on 25.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var email: String?
    @NSManaged public var uuid: String?

}

extension Users : Identifiable {

}
