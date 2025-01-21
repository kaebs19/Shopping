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
    case Black = "BlackLib"
    case White = "WhiteLib"
    case Red = "RedLib"
    case Grey = "GreyLib"
    case XSmall = "XSmallLib"
    case Small = "SmallLib"
    case Medium = "MediumLib"
    case Large = "LargeLib"
    case XLarge = "XLargeLib"
    case XXLarge = "XXLargeLib"
    case Oversize = "OversizeLib"
    case Size = "SizeLib"
    case Color = "ColorLib"
    case EstimatedDelivery = "EstimatedDeliveryLib"
    case addToBag = "AddToBagLib"
    case myAddress = "MyAddressLib"
    case AddressName = "AddressNameLib"
    case City = "CityLib"
    case ZipCode = "ZipCodeLib"
    case District = "DistrictLib"
    case street = "StreetLib"
    case AddAddress = "AddAddressLib"
    case ChangeLanguage = "ChangeLanguageLib"
    case Notification = "NotificationLib"
    case OFF = "OFFLib"
    case ON = "ONLib"
    case FAQ = "FAQLib"
    case Question = "QuestionLib"
    case Answer = "AnswerLib"
    
    var textLib: String {
        return rawValue.localized
    }
}
