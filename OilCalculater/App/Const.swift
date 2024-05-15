//
//  Const.swift
//  OilCalculater
//
//  Created by OmerErbalta on 8.05.2024.
//

import Foundation
import UIKit

class Const{
   static let width = UIScreen.main.bounds.width
   static let height = UIScreen.main.bounds.height
    
    enum Color {
        case primaryColor
        case secondryColor
        var uiColor: UIColor {
            switch self {
            case .primaryColor:
                return .red
            case .secondryColor:
                return .green
            }
        }
    }

}
