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
    case againPassword = "againPasswordTF"
    case phoneNumber = "phoneNumberTF"
    case Search = "SearchTF"
    case NameSurname = "NameSurnameTF"
    case CardNumber = "CardNumberTF"
    case CVC = "CVCTF"
    case ExpirationDate = "ExpirationDateTF"
    case ZipCode = "ZipCodeTF"
    case AddressName = "AddressNameTF"
    case City = "CityTF"
    case District = "DistrictTF"
    case Street = "StreetTF"
    
    
    var placeholder: String {
        return rawValue.localized
    }
}
