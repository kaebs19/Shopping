//
//  Languages.swift
//  Shopping
//
//  Created by Mohammed Saleh on 20/01/2025.
//

import Foundation
import UIKit

struct Languages {
    
    let languageName: LanguageName
    var isSelected: Bool
    
    
    var image: UIImage {
        if isSelected {
            UIImage(named: Images.Select_Object.names) ?? UIImage()
        } else {
            UIImage(named: Images.Unselected_Object.names) ?? UIImage()
        }
    }
    
    var description: String {
        return "Language: \(languageName.description) , selected: \(isSelected)"
    }
    
}

enum LanguageName {
    case Arabic
    case English
    
    var description: String {
        switch self {
            case .Arabic: return "العربية"
            case .English: return "English"
        }
    }
}
