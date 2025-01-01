//
//  Colors+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import UIKit


extension UIColor {
    
    convenience init?(hex: String) {
        // حذف أي مسافات أو رموز #
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexFormatted = hexFormatted.replacingOccurrences(of: "#", with: "")
        
        // التحقق من أن طول السلسلة 6، مثل #FFFFFF
        guard hexFormatted.count == 6,
              let rgbValue = UInt(hexFormatted, radix: 16) else { return nil }
        
        // استخراج قيم الأحمر، الأخضر، الأزرق من قيمة hex
        let red = CGFloat((rgbValue >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgbValue >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgbValue & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

