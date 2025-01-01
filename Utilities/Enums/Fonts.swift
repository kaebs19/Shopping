//
//  Fonts.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation
import UIKit

import UIKit

enum AppFont: String {
    case cairoBlack = "Cairo-Black"
    case cairoBold = "Cairo-Bold"
    case cairoExtraBold = "Cairo-ExtraBold"
    case cairoLight = "Cairo-Light"
    case cairoMedium = "Cairo-Medium"
    case cairoRegular = "Cairo-Regular"
  
    
    func of(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: self.rawValue, size: size) else {
            fatalError("Font \(self.rawValue) not found. Make sure the font is added to the project and the name is correct.")
        }
        return font
    }
}

enum FontStyle {
    
    case regular
    case bold
    case semibold
    
    var weight: UIFont.Weight {
        switch self {
            case .regular: return .regular
            case .bold: return .bold
            case .semibold: return .semibold
        }
    }
}

enum Fonts: String {
    
    case Black = "BlackFont"
    case Regular = "RegularFont"
    case SemiBold = "SemiBoldFont"
    
    var typeFont:String{
        return self.rawValue.localized
    }

}
