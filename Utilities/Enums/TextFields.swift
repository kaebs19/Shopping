//
//  TextFields.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation

enum TextFields: String {
    
    case email = "EmailTF"
    case password = "passwordTF"
    
    var placeholder: String {
        return rawValue.localized
    }
}
