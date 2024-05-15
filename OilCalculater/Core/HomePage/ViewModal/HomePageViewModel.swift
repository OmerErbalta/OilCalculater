//
//  HomePageViewModal.swift
//  OilCalculater
//
//  Created by OmerErbalta on 9.05.2024.
//
import Foundation
import UIKit
protocol HomePageViewControllerProtocol{
    var cars : [Car]{get set}
    func addCar(plate:String,image:UIImage)
}

class HomePageViewModel : HomePageViewControllerProtocol {
    var cars: [Car] = []
    
    func addCar(plate: String, image: UIImage) {
        let newCar = Car(billList: [], plate: plate, image: image)
        cars.append(newCar)
    }
}
