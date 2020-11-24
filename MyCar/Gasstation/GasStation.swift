//
//  GasStation.swift
//  MyCar
//
//  Created by MacBook on 24.11.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

struct Refueling {
    var countOfLitres: Double
    var totalMileage: Double
    var fullTank: Bool
    var date: String
}

class GasStation {
    var refueling: Array<Refueling> = []
    init(refueling: Refueling?) {
        guard let refueling = refueling else { return }
        self.refueling.append(refueling)
    }
    
    func countOfRefueling() -> Int {
        refueling.count
    }
    
}
