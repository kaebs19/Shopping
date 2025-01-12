//
//  TextField+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 02/01/2025.
//

import Foundation
import UIKit


extension UITextField {
    
    /// Customizes the UITextField with the provided parameters.
    /// يُخصص UITextField باستخدام المعاملات المقدمة.
    
    func customTextField(placeholder: TextFields, placeholderColor: Colors = .C9F97979, textColor: Colors = .C161616, ofSize: Sizes, font: AppFont = .cairoRegular, styleFont: FontStyle = .regular, isPassword: Bool = false , direction: Directions = .Normal) {
        self.placeholder = placeholder.placeholder
        self.tintColor = placeholderColor.uiColor
        self.textColor = textColor.uiColor
        self.font = UIFont(name: font.rawValue, size: ofSize.rawValue) ?? UIFont.systemFont(ofSize: ofSize.rawValue, weight: styleFont.weight)
        self.isSecureTextEntry = isPassword
        
        switch direction {
            case .Right: self.textAlignment = .right
            case .Left: self.textAlignment = .left
            case .Center: self.textAlignment = .center
            case .Normal: self.textAlignment = isEnglish() ? .left : .right
        }
    }
    
    func togglePassword() {
        self.isSecureTextEntry.toggle()
    }
    
    /// Converts the current text in the text field to uppercase
    func convertTextToUppercase() {
        self.text = self.text?.uppercased()
    }
}
