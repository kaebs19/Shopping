//
//  imgs.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation

enum Imags: String, CaseIterable {
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
    case Back = "Back"
    case Cart = "Cart"
    case Filter = "Filter"
    case Menu = "Menu"
    
    
    var names: String {
        return rawValue
    }
}
