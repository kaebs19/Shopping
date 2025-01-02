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
    
    
    var textBut: String{
        return rawValue.localized
    }
}
