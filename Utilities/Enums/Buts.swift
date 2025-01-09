//
//  Buts.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation


enum Buts: String{
    
    case login = "loginBut"
    case forgotPassword = "forgotPasswordBut"
    case signUp = "signUpBut"
    case more = "moreBut"
    case sale = "saleBut"
    
    
    var textBut: String{
        return rawValue.localized
    }
}
