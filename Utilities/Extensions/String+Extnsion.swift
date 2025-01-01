//
//  String+Extnsion.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation
import UIKit

extension String {
    
    /// Returns the localized version of the string.
    /// يُرجع النسخة المترجمة من النص.
    ///
    /// This property uses `NSLocalizedString` to fetch the localized string
    /// from the Localizable.strings file.
    /// تُستخدم هذه الخاصية `NSLocalizedString` لجلب النص المترجم من ملف Localizable.strings.
    ///
    /// - Returns: The localized string.
    ///            النص المترجم.
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
