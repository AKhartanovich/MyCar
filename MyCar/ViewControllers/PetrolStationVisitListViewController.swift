//
//  PetrolStationVisitListViewController.swift
//  MyCar
//
//  Created by MacBook on 30.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

class PetrolStationVisitListViewController: UIViewController{
    
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.navigationItem.title = "My petrol station visit"
        
        self.view.addSubview(self.tableView)
//        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
//        self.tableView.dataSource = self
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
//        self.navigationController?.navigationBar.isHidden = false
//        self.navigationController?.navigationBar.backgroundColor = .none
        // Do any additional setup after loading the view.
        self.updateLayout(with: self.view.frame.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
    
    
    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }

}

//extension PetrolStationVisitListViewController: UITableViewController {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
//
//class TableViewCell: UITableViewCell {
//    <#code#>
//}
