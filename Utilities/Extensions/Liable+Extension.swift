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
    func customLabel(text: String , color: Colors , size: Sizes , font: AppFont = .cairoBlack , typeFont: FontStyle = .regular , direction: Directions = .Normal , line: Int = 0) {
        self.text = text
        self.textColor = color.uiColor
        
        guard let customFont = UIFont(name: font.rawValue, size: size.rawValue) else {
            print("⚠️ Font not found. Using system font.")
            self.font = UIFont.systemFont(ofSize: size.rawValue, weight: typeFont.weight)
            return
        }
        self.font = customFont
        
        switch direction {
            case .Right: self.textAlignment = .right
            case .Left: self.textAlignment = .left
            case .Center: self.textAlignment = .center
            case .Normal: self.textAlignment = isEnglish() ? .left : .right
        }
        self.numberOfLines = line
    }
    
    /// Sets attributed text with specific attributes.
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
    
    /// Add underline to the label
    func addUnderline() {
        guard let text  = text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.attributedText = attributedString
    }
    
    /// Add shadow to the label
    func addShadow(color: Colors = .C000000 , opacity: Float = 0.5 , radius: CGFloat = 4, offset: CGSize = .zero) {
        self.layer.shadowColor = color.uiColor?.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.masksToBounds = false
    }

    /// Formats and displays a delivery date with a prefix.
    func setDeliveryDate(prefix: String , date: Date , color: Colors , size: Sizes , font: AppFont = .cairoRegular ,typeFont: FontStyle = .regular  ,direction: Directions = .Normal , line: Int = 0) {
        
        // 1. تنسيق التاريخ
        let dateFormatter = DateFormatter()
        
        if isEnglish() {
            dateFormatter.dateFormat = "dd MMMM"   // تنسيق التاريخ بالإنجليزية (28 October)
        } else {
            dateFormatter.locale = Locale(identifier: "ar")   // تعيين اللغة العربية
            dateFormatter.dateFormat = "dd MMMM"  // تنسيق التاريخ بالعربية (28 أكتوبر)
        }
        
        let formattedDate = dateFormatter.string(from: date)
        // 2. دمج النص مع التاريخ
        let fullText = "\(prefix): \(formattedDate)"
        // 3. تطبيق الخصائص على الـ UILabel
        self.customLabel(text: fullText, color: color, size: size, font: font, typeFont: typeFont, direction: direction, line: line)
    }
}
