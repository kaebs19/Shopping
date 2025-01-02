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
    case C110F24 = "#110F24"
    case C9F97979 = "#9F97979"
    case C000000 = "#000000"
    case CF7F7F7 = "#F7F7F7"
    
    var uiColor: UIColor? {
        return UIColor(hex: self.rawValue)
    }
}
