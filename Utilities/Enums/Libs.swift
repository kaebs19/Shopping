//
//  Libs.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation


enum Libs: String {
    
    case Signin = "SigninLib"
    case email = "EmailLib"
    case password = "PasswordLib"
    case Signup = "SignupLib"
    case loginWithSocialMedia = "LoginWithSocialMediaLib"
    case dontHaveAccount = "DontHaveAccountLib"
    
    
    var textLib: String {
        return rawValue.localized
    }
}
