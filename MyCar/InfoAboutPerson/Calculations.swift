//
//  Calculations.swift
//  MyCar
//
//  Created by MacBook on 26.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit
import CoreData

struct DataRefuling {
    var fullTank: Bool
    var literes: Double
    var price: Double
    var totalMileage: Double
}

func calculateAverageConsumption() -> (Double,Double,Double,Int) {
    //create Subject
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return (0,0,0,0)}
    let context = appDelegate.persistentContainer.viewContext
    //create array of refueling
    var refuelingArray: Array<DataRefuling> = []
    //create refueling
    var myRefueling: DataRefuling
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Refueling")
    request.predicate = NSPredicate(format: "ANY users.uuid = %@", UserDataManager.instance.UUID)
    do {
        if let result = try context.fetch(request) as? [Refueling] {
            for data in result as [NSManagedObject] {
                let fullTank = data.value(forKey: "fullTank") as? Bool
                let literes = data.value(forKey: "literes") as? Double
                let price = data.value(forKey: "price") as? Double
                let totalMileage = data.value(forKey: "totalMileage") as? Double
                guard let fulltank = fullTank else {return (0,0,0,0)}
                guard let litr = literes else {return (0,0,0,0)}
                guard let pr = price else {return (0,0,0,0)}
                guard let totalKM = totalMileage else {return (0,0,0,0)}
                myRefueling = DataRefuling(fullTank: fulltank, literes: litr, price: pr, totalMileage: totalKM)
                refuelingArray.append(myRefueling)
            }
        }
    } catch { }
    
    var literes: Double = 0
    var price: Double = 0
    var totalMileage: Double = 0
    
    let Mileage: Double
    if (refuelingArray.last?.totalMileage) != nil
    {
        Mileage = refuelingArray.last!.totalMileage
    } else {
        Mileage = 0
    }
    var startMileage: Double = 0
    let countRefueling = refuelingArray.count
    
    for i in 0 ..< refuelingArray.count {
        if refuelingArray.count == 0{
            return (0,0,0,0)
        } else if refuelingArray.count == 1{
            startMileage = refuelingArray[0].totalMileage
            literes += refuelingArray[i].literes - startMileage
            price += refuelingArray[i].price
            totalMileage = refuelingArray[i].totalMileage
        } else if refuelingArray[i].fullTank == false && refuelingArray.count > 1 {
            startMileage = refuelingArray[0].totalMileage
            literes += refuelingArray[i].literes
            price += refuelingArray[i].price
            totalMileage = refuelingArray[i].totalMileage - startMileage
        } else if refuelingArray[refuelingArray.count - 1].fullTank == true && refuelingArray.count > 1 {
            startMileage = refuelingArray[0].totalMileage
            price += refuelingArray[i].price
            totalMileage = refuelingArray[i].totalMileage - startMileage
        }
    }
    
    let averageConsumption: Double = 100 * literes / totalMileage
    
    
    return (averageConsumption,price,Mileage, countRefueling)
}
