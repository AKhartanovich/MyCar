//
//  Refueling+CoreDataProperties.swift
//  MyCar
//
//  Created by MacBook on 26.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//
//

import Foundation
import CoreData


extension Refueling {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Refueling> {
        return NSFetchRequest<Refueling>(entityName: "Refueling")
    }

    @NSManaged public var fullTank: Bool
    @NSManaged public var literes: Double
    @NSManaged public var price: Double
    @NSManaged public var totalMileage: Double
    @NSManaged public var users: Users?

}

extension Refueling : Identifiable {

}
