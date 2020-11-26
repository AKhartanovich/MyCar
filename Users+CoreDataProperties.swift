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
    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var uuid: String?
    @NSManaged public var refueling: NSSet?

}

// MARK: Generated accessors for refueling
extension Users {

    @objc(addRefuelingObject:)
    @NSManaged public func addToRefueling(_ value: Refueling)

    @objc(removeRefuelingObject:)
    @NSManaged public func removeFromRefueling(_ value: Refueling)

    @objc(addRefueling:)
    @NSManaged public func addToRefueling(_ values: NSSet)

    @objc(removeRefueling:)
    @NSManaged public func removeFromRefueling(_ values: NSSet)

}

extension Users : Identifiable {

}
