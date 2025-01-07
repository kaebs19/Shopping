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
    case collections = "CollectionsLib"
    case featuredProducts = "FeaturedProductsLib"
    case welcome = "WelcomeLib"
    case orders = "OrdersLib"
    case WishList = "WishListLib"
    case LastViewed = "LastViewedLib"
    case ShippingAdress = "ShippingAdressLib"
    case Language = "LanguageLib"
    case Settings = "SettingsLib"
    case Help = "HelpLib"
    case logout = "LogoutLib"
    
    var textLib: String {
        return rawValue.localized
    }
}
