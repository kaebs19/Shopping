//
//  Categories.swift
//  Shopping
//
//  Created by Mohammed Saleh on 08/01/2025.
//

import Foundation
import UIKit


/// يمثل فئة تحتوي على اسم، صورة، وخلفية.
/// Represents a category with a name, image, and background.
    struct Categories {
        var name: String
        var image: String
        var background: [ColorsBackground]
        
        /// يحول قائمة الألوان إلى نمط خلفية (صلبة أو متدرجة).
        /// Converts the list of colors to a background style (solid or gradient).
        var backgroundStyle: UIView.BackgroundStyle {
            if background.count == 1 {
                // إذا كان لون واحد، يتم استخدام نمط الخلفية لون.
                // If there's one color, use solid background style.
                if let colorEnum = ColorsBackground(rawValue: background[0].rawValue) {
                    return .solid(colorEnum.uiColor ?? .clear)
                } else {
                    return .solid(UIColor(hex: background[0].rawValue) ?? .clear)
                }
            } else if background.count >= 2 {
                // إذا كان هناك لونان أو أكثر، يتم استخدام نمط التدرج.
                // If there are two or more colors, use gradient background style.
                let colors = background.compactMap { ColorsBackground(rawValue: $0.rawValue)?.uiColor ?? UIColor(hex: $0.rawValue) }
                return .gradient(colors)
            } else {
                // إذا لم يتم تحديد ألوان، يتم استخدام لون شفاف.
                // If no colors are specified, use a clear color.
                return .solid(.clear)
            }
        }
    }

