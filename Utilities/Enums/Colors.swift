//
//  Colors.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation
import UIKit


enum Colors: String {
    
    case C161616 = "#161616"
    case CFFFFFF = "#FFFFFF"
    case C00CBFF = "#00CBFF"
    case CE6E6E6 = "#E6E6E6"
    case C110F24 = "#110F24"
    case C9F97979 = "#9F97979"
    case C000000 = "#000000"
    case CF7F7F7 = "#F7F7F7"
    case CC84040_Rad = "#C84040"
    case CEEEEEE = "#EEEEEE"
    case CBFBFBF = "#CBFBFB"
    case C867F7F = "#867F7F"
    case CFF7A59 = "#FF7A59"
    case C6DCEE7 = "#6DCEE7"
    case CCCCED0 = "#CCCED0"
    case CECEBE9 = "#ECEBE9"
    case Clear = "clear"

    
    var uiColor: UIColor? {
        if self == .Clear {
            return .clear
        }else {
            return UIColor(hex: self.rawValue)
        }
    }
}


enum ColorsBackground: String {
    case Red = "#FF7A59"       /// لون أحمر بتدرج  - Red color
    case Green = "#6DCEE7"     /// لون أخضر بتدرج  - Green color
    case Blue = "#0091FF"      /// لون أزرق بتدرج  - Blue color
    case Yellow = "#FFFF00"    /// لون أصفر بتدرج  - Yellow color
    case White = "#FFFFFF"     /// لون أبيض بتدرج  - White color
    case Black = "#000000"     /// لون أسود بتدرج  - Black color
    case Orange = "#ff8000"    /// لون برتقالي بتدرج  - Orange
    case Gray = "#E6E6E6"      /// لون رمادي بتدرج  - Gray color
    case LightGray = "#F7F7F7" /// لون رمادي فاتح بتدرج  - Light gray color
    case Pink = "#ff479c"      /// لون وردي بتدرج  - Pink color
    case RoseGold = "#E6B8B7"  /// وردي ذهبي ناعم
    case Lavender = "#E6E6FA" /// لون لافندر فاتح
    case NavyBlue = "#001F3F" /// أزرق داكن
    case SteelGray = "#7D7D7D" /// رمادي معدني
    case Lemon = "#FFF44F" /// أصفر ليموني فاتح
    case Aqua = "#00FFFF" /// أزرق فيروزي
    case SunsetOrange = "#FF8288" /// color button sale -1
    case DeepPurple = "#804144" /// color button sale -2
    case CFF8188 = "#F81888" 
    case StartGradation = "#32C5FF"
    case MiddleGradation = "#B620E0"
    case EndGradation = "#F7B500"
    case Background = "#ECEBE9"
    case CFFE68F = "#FFE68F"
    case C6CB0FE = "#6CB0FE"
    
    /// يحول قيمة HEX إلى UIColor.
    /// Converts HEX value to UIColor.
    var uiColor: UIColor? {
        return UIColor(hex: self.rawValue)
    }
}
