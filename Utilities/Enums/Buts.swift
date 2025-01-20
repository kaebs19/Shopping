//
//  Buts.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation

/// Enum representing button types in the app.
enum Buts: String {
    /// Button for login action
    case login = "loginBut"
    /// Button for forgot password action
    case forgotPassword = "forgotPasswordBut"
    /// Button for sign-up action
    case signUp = "signUpBut"
    /// Button for more options
    case more = "moreBut"
    /// Button for sales
    case sale = "saleBut"
    /// Button for shopping now
    case shopNow = "shopNowBut"
    /// Button for payment
    case payment = "paymentBut"
    case Done = "DoneBut"
    case AddNewAddress = "AddNewAddressBut"
    case SaveAddress = "SaveAddressBut"
    case EditAddress = "EditAddressBut"
    
    /// Returns the localized text for the button
    var textBut: String {
        rawValue
    }
}

enum  CartButtonState {
    case shopNow
    case proceedToPayment
    
    var title: Buts {
        switch self {
            case .shopNow: return .shopNow
            case .proceedToPayment: return .payment
        }
    }
}

