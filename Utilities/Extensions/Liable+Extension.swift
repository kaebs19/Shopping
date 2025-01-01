//
//  Liable+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation
import UIKit

extension UILabel {
    /// Customizes the UILabel with the provided parameters.
    /// - Parameters:
    ///   - text: The text to display.
    ///   - color: The color of the text.
    ///   - size: The size of the font.
    ///   - font: The custom font to use. Defaults to `.cairoRegular`.
    ///   - typeFont: The font weight style. Defaults to `.regular`.
    ///   - direction: The text alignment direction. Defaults to `.normal`.
    ///   - line: The number of lines. Defaults to `0`.

    func customLabel(text: String , color: Colors , size: Sizes , font: AppFont = .cairoBlack , typeFont: FontStyle = .regular , direction: Directions = .Normal , line: Int = 0) {
        self.text = text
        self.textColor = color.uiColor
        self.font = UIFont(name: font.rawValue, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue, weight: typeFont.weight)
        switch direction {
            case .Right: self.textAlignment = .right
            case .Left: self.textAlignment = .left
            case .Center: self.textAlignment = .center
            case .Normal: self.textAlignment = isEnglish() ? .left : .right
        }
        self.numberOfLines = line
    }
    
    /// Sets attributed text with specific attributes.
    /// - Parameters:
    ///   - text: The text to display.
    ///   - attributes: An array of tuples containing the range and attributes to apply.

    func setAttributedText(_ text: String, attributes: [(range: NSRange, attribute: [NSAttributedString.Key: Any])]) {
        // إنشاء NSMutableAttributedString
        let attributedString = NSMutableAttributedString(string: text)
        // تطبيق السمات على النصوص
        for attribute in attributes {
            attributedString.addAttributes(attribute.attribute, range: attribute.range)
        }
        // تعيين النص المخصص إلى UILabel
        self.attributedText = attributedString
    }

    
}
