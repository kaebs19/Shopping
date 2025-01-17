//
//  ProductOptions.swift
//  Shopping
//
//  Created by Mohammed Saleh on 17/01/2025.
//

import Foundation
import UIKit

struct ProductOptions {
    let sizes: [Size]         // قائمة الأحجام
    let colors: [Color]       // قائمة الألوان
    
}
struct Size {
    let name: String          // اسم الحجم (مثل "Small")
    var isSelected: Bool      // هل تم اختياره؟
    var image: UIImage {
        if isSelected {
            return UIImage(named: Images.Select_Object.names) ?? UIImage()
        } else {
            return UIImage(named: Images.Unselected_Object.names) ?? UIImage()

        }
    }
}

struct Color {
    let name: String          // اسم اللون (مثل "Red")
    var isSelected: Bool      // هل تم اختياره؟
    let colorValue: UIColor   // قيمة اللون (مثل UIColor.red)
    var image: UIImage {
        if isSelected {
            return UIImage(named: Images.Select_Object.names) ?? UIImage()
        }   // صورة الحجم (اختياري)
        return UIImage(named: Images.Unselected_Object.names) ?? UIImage()
    }
}



