//
//  Button+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 02/01/2025.
//

import Foundation
import UIKit
import SwiftMessages

extension UIButton {
    
    /// Customizes the UIButton with the provided parameters.
      /// يُخصص UIButton باستخدام المعاملات المقدمة.
    func customButton(text: Buts , textColor: Colors , backgroundColor: Colors = .CFFFFFF , ofSize: Sizes  , font: AppFont , styleFont: FontStyle , direction: Directions = .Normal) {
        
        self.setTitle(text.textBut, for: .normal)
        self.tintColor = textColor.uiColor
        self.backgroundColor = backgroundColor.uiColor
        self.titleLabel?.font = UIFont(name: font.rawValue, size: ofSize.rawValue) ?? UIFont.systemFont(ofSize: ofSize.rawValue, weight: styleFont.weight)
        
        switch direction {
            case .Right: self.titleLabel?.textAlignment = .right
            case .Left: self.titleLabel?.textAlignment = .left
            case .Center: self.titleLabel?.textAlignment = .center
            case .Normal: self.titleLabel?.textAlignment = isEnglish() ? .left : .right
        }
    }
    
    /// Adds a corner radius to the button.
    /// يُضيف نصف قطر زاوية إلى الزر.
    func addRadius(cornerRadius: CGFloat){
        self.layer.cornerRadius = cornerRadius
    }
    
    /// Adds a border to the button.
    /// يُضيف حدودًا إلى الزر.
     func addBoderBut(color: Colors, width: CGFloat) {
         self.layer.borderColor = color.uiColor?.cgColor
         self.layer.borderWidth = width
    }
    
    /// Sets an attributed title for the button.
    /// يُضيف نصًا منسقًا إلى الزر.
    func setAttributedTitle(text: String, attributes: [NSAttributedString.Key: Any], for state: UIControl.State = .normal) {
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        self.setAttributedTitle(attributedString, for: state)
    }
    
    
    
    
}
