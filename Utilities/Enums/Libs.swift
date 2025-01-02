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
    case dontHaveAnAccount = "DontHaveAnAccountLib"
    case PhoneNumber = "PhoneNumberLib"
    case AgainPassword = "AgainPasswordLib"
    case signupWithSocialMedia = "SignupWithSocialMediaLib"
    case Doyoualreadyhaveanaccount = "DoyoualreadyhaveanaccountLib"
    case loginWithSocial = "LoginWithSocialLib"
    case forgotPassword = "ForgotPasswordLib"
    case detilsPassword = "DetailsPasswordLib"
    
    
    var textLib: String {
        return rawValue.localized
    }
}
