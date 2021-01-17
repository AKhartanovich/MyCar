//
//  PetrolStationVisitListViewController.swift
//  MyCar
//
//  Created by MacBook on 30.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit
import CoreData

class PetrolStationVisitListViewController: UIViewController {
    var refueling: DataRefuling = DataRefuling(fullTank: false, literes: 0, price: 0, totalMileage: 0)
    var refuelingArray: Array<DataRefuling> = [] {
        didSet {
            tableView.reloadData()
        }
    }
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
    let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backAction(_:)))

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        initTableView()
        getFuelingWithEmployee()
        navigationController?.navigationBar.topItem?.leftBarButtonItem = newBackButton
    }
    
    
    func initTableView(){
        view.addSubview(tableView)
        tableView.fillSuperView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    func getFuelingWithEmployee(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Refueling")
        request.predicate = NSPredicate(format: "ANY users.uuid = %@", UserDataManager.instance.UUID)
        do {
            if let result = try context.fetch(request) as? [Refueling] {
                for data in result as [NSManagedObject] {
//                    print(data.value(forKey: "literes") as! Double)
//                    print(data.value(forKey: "fullTank") as! Bool)
//                    print(data.value(forKey: "price") as! Double)
//                    print(data.value(forKey: "totalMileage") as! Double)
                    refueling.fullTank = data.value(forKey: "fullTank") as! Bool
                    refueling.literes = data.value(forKey: "literes") as! Double
                    refueling.price = data.value(forKey: "price") as! Double
                    refueling.totalMileage = data.value(forKey: "totalMileage") as! Double
                    refuelingArray.append(refueling)
                }
                print(result.count)
            }
        } catch { }
    }
    @objc func backAction(_: UIButton) -> Void {
        self.navigationController?.popViewController(animated: true)
//        navigationController?.navigationBar.isHidden = true
    }
}

extension PetrolStationVisitListViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tableView.beginUpdates()
            refuelingArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = ScrollViewViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
}


extension PetrolStationVisitListViewController: UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        refuelingArray.count
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        refuelingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//        let section = refuelingArray[indexPath.section]
        if(refuelingArray[indexPath.row].fullTank == false){
            cell.fullTantLabel.text = "Doesn`t full tank"
        } else {
            cell.fullTantLabel.text = "Full tank"
        }
        cell.literesLabel.text = String(refuelingArray[indexPath.row].literes) + " Literes"
        cell.priceLabel.text = String(refuelingArray[indexPath.row].price) + " BYN"
        cell.totalMileageLabel.text = String(refuelingArray[indexPath.row].totalMileage) + " Total mileage"
        return cell
    }
}

class CustomCell: UITableViewCell {
    
    var fullTantLabel: UILabel = UILabel()
    var literesLabel: UILabel = UILabel()
    var priceLabel: UILabel = UILabel()
    var totalMileageLabel: UILabel = UILabel()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            initCellWithFitches()
    }
    
    private func initCellWithFitches() {
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        addSubview(fullTantLabel)
        fullTantLabel.translatesAutoresizingMaskIntoConstraints = false
        fullTantLabel.textAlignment = .center
        fullTantLabel.top(equalTo: self.topAnchor)
        fullTantLabel.leading(equalTo: self.leadingAnchor)
        fullTantLabel.trailing(equalTo: self.trailingAnchor)
        fullTantLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addSubview(literesLabel)
        literesLabel.translatesAutoresizingMaskIntoConstraints = false
        literesLabel.textAlignment = .center
        literesLabel.top(equalTo: fullTantLabel.bottomAnchor)
        literesLabel.leading(equalTo: self.leadingAnchor)
        literesLabel.trailing(equalTo: self.trailingAnchor)
        literesLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textAlignment = .center
        priceLabel.top(equalTo: literesLabel.bottomAnchor)
        priceLabel.leading(equalTo: self.leadingAnchor)
        priceLabel.trailing(equalTo: self.trailingAnchor)
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addSubview(totalMileageLabel)
        totalMileageLabel.translatesAutoresizingMaskIntoConstraints = false
        totalMileageLabel.textAlignment = .center
        totalMileageLabel.top(equalTo: priceLabel.bottomAnchor)
        totalMileageLabel.leading(equalTo: self.leadingAnchor)
        totalMileageLabel.trailing(equalTo: self.trailingAnchor)
        totalMileageLabel.bottom(equalTo: self.bottomAnchor)
        totalMileageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




//DispatchQueue.main.async {
//    <#code#>
//}
