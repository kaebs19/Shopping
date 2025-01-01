//
//  Helper.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation
import UIKit
import MOLH



public var screenWidth: CGFloat { get { return UIScreen.main.bounds.size.width } }
public var screenHeight:CGFloat { get { return UIScreen.main.bounds.size.height } }
public var iPhoneXFactor: CGFloat { get {return ((screenWidth * 1.00) / 360)} }

/// Checks if the current language is English.
/// - Returns: `true` if the language is English, Arabic `false`.
public func isEnglish() -> Bool {
    
    if MOLHLanguage.isArabic() {
        return false
    } else {
        return true
    }
}
