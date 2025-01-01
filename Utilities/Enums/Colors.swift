//
//  Colors.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation
import UIKit


enum Colors: String {
    
    case C161616 = "#161616"
    case CFFFFFF = "#FFFFFF"
    case C00CBFF = "#00CBFF"
    case CE6E6E6 = "#E6E6E6"

    var uiColor: UIColor? {
        return UIColor(hex: self.rawValue)
    }
}
