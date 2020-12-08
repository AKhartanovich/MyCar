//
//  CoreDataMethods.swift
//  MyCar
//
//  Created by MacBook on 8.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit
import CoreData

///Функция удаления из базы по условию
func deleteDataFromCoreDataWith(entityName: String, nsPredicatFormat: String, findString: String){
    //As we know that container is set up in the AppDelegates so we need to refer that container.
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    //We need to create a context from this container
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    request.predicate = NSPredicate(format: nsPredicatFormat, findString)
    do
   {
    let test = try context.fetch(request)
    let objectToDelete = test[0] as! NSManagedObject
    context.delete(objectToDelete)
    do {
        try context.save()
    }
    catch {
        print(error)
    }
   } catch {
    print(error)
   }
}

///Создание пользователя в Core Data
func createDataFor(entity: String, name: String, surname: String, UUID: String, email: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    //context
    let context = appDelegate.persistentContainer.viewContext
    //Entity
    guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else {return}
    let user = Users(entity: entity, insertInto: context)
    user.email = email
    user.name = name
    user.surname = surname
    user.uuid = UUID
    do {
        try context.save()
    } catch let error as NSError {
        print("\(error), \(error.userInfo)")
    }
}


func retrieveDateFrom(entityName: String){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
            print(data.value(forKey: "name") as! String)
            print(data.value(forKey: "surname") as! String)
            print(data.value(forKey: "email") as! String)
            print(data.value(forKey: "uuid") as! String)
        }
    } catch let error as NSError {
        print(error)
    }
}
/// Получение информации о пользователях в CoreData
func retrieveDataFromCoreDataAboutUser(email: String, entityName: String, format: String) -> [Any]? {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    request.predicate = NSPredicate(format: format, email)
    do {
        let res = try context.fetch(request)
        return res
    } catch {
        return nil
    }
}
