//
//  CarDetailViewModel.swift
//  OilCalculater
//
//  Created by OmerErbalta on 9.05.2024.
//

import Foundation

class CarDetailViewModel {
    private let car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var plateNumber: String {
        return car.plate
    }
    
    var kilometerText: String {
        return "Araç Kilometresi: \(car.kilometer)"
    }
    
    // Diğer gerekli bilgileri ve işlemleri buraya ekleyebilirsiniz
}
