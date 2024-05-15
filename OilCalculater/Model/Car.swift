//
//  Car.swift
//  OilCalculater
//
//  Created by OmerErbalta on 8.05.2024.
//

import Foundation
import UIKit

struct Car{
    var billList :[Bill] = []
    var plate :String
    var image : UIImage = UIImage(named: "car.rear")!
    var kilometer = 0
    
    
   mutating func addBill(bill:Bill) {
        self.billList.append(bill)
    }
}
