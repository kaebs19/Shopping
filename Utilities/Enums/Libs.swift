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
    case Women = "WomenLib"
    case Men = "MenLib"
    case Kids = "KidsLib"
    case catrgories = "CatrgoriesLib"
    case ShoppingBag = "ShoppingBagLib"
    case MessageEmpty = "MessageEmptyLib"
    case ShoppingTitle = "ShoppingTitleLib"
    case NameSurname = "NameSurnameLib"
    case CardNumber = "CardNumberLib"
    case ExpirationDate = "ExpirationDateLib"
    case CVC = "CVCLib"
    case Select = "SelectLib"
    case Totle = "TotleLib"
    case Pay = "PayLib"
    case ShppingMethod = "ShppingMethodLib"
    case NewArrivals = "NewArrivalsLib"
    case Dresses = "DressesLib"
    case ShirtAndBlouses  = "ShirtAndBlousesLib"
    case Jeans = "JeansLib"
    case Sale = "SaleLib"
    
    var textLib: String {
        return rawValue.localized
    }
}
