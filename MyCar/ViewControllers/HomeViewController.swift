//
//  HomeViewController.swift
//  MyCar
//
//  Created by MacBook on 24.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    var dataCalc: (Double,Double,Double,Int) = (0,0,0,0)
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let rootView: UIView = {
       let rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
    let labal1: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    let labal2: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    let labal3: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textColor = .white
        return label
    }()
    
    override func loadView() {
        super.loadView()
        dataCalc = calculateAverageConsumption()
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.image = UIImage(named: "home.jpg")
        
        view.addSubview(rootView)
        rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        rootView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        rootView.addSubview(labal1)
        labal1.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 20).isActive = true
        labal1.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 10).isActive = true
        labal1.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -10).isActive = true
        labal1.textAlignment = .left
        labal1.text = "Средний расход: " + String(Double(round(10*dataCalc.0)/10)) + " л/100км"
        
        rootView.addSubview(labal2)
        labal2.topAnchor.constraint(equalTo: labal1.bottomAnchor, constant: 20).isActive = true
        labal2.leadingAnchor.constraint(equalTo: labal1.leadingAnchor).isActive = true
        labal2.trailingAnchor.constraint(equalTo: labal1.trailingAnchor, constant: -10).isActive = true
        labal2.textAlignment = .left
        labal2.text = "Потрачено денег на топливо: " + String(dataCalc.1) + " BYN"
        
        rootView.addSubview(labal3)
        labal3.topAnchor.constraint(equalTo: labal2.bottomAnchor, constant: 20).isActive = true
        labal3.leadingAnchor.constraint(equalTo: labal2.leadingAnchor).isActive = true
        labal3.trailingAnchor.constraint(equalTo: labal2.trailingAnchor, constant: -10).isActive = true
        labal3.textAlignment = .left
        labal3.text = "Общий пробег : " + String(dataCalc.2) + " Km"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func retrieveDate(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        //context
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
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
    
    func getFuelingWithEmployee(username: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        //context
        let context = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Refueling")
        request.predicate = NSPredicate(format: "ANY users.uuid = %@", Person.instance.UUID)
        do {
            if let result = try context.fetch(request) as? [Refueling] {
                for data in result as [NSManagedObject] {
                    print(data.value(forKey: "literes") as! Double)
                }
                print(result.count)
            }
        } catch { }
    }
    



}
