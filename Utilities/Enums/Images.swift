//
//  imgs.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation

enum Images: String, CaseIterable {
    case Eye_of = "eye-off"
    case Eye_on = "eye_on"
    
    case Home_TabBar = "home"
    case Home_unselected = "home_unSelect"
    case Category_TabBar = "Category"
    case Category_unselected = "Category_unSelect"
    case Featured_TabBar = "Featured"
    case Featured_unselected = "Featured_unSelect"
    case Account_TabBar = "Account"
    case Account_unselected = "Account_unSelect"
    case Back = "left_icon"
    case Cart = "Cart"
    case Filter = "Filter"
    case Menu = "Menu"
    case Back_Icon = "Back"
    case Previous_icon = "Previous_icon"
    

    case Address_menu = "address"
    case Help_circle_menu = "help-circle"
    case Language_menu = "language"
    case Lost_view_menu = "lost_view"
    case Order_menu = "order"
    case Settings_menu = "settings"
    case Wish_List = "WishList"
    case Women = "m1"
    case Men = "men"
    case Kids = "kids"
    case Photo_1 = "photo_1"
    case Photo_2 = "photo_2"
    case Unselected_Object = "Unselected_Object"
    case Select_Object = "Select_Object"
    case Fedex = "fedex"
    case Dhl = "dhl"
    case china_post = "china_post"
    
    
    var names: String {
        return rawValue
    }
}
