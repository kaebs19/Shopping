//
//  FAQ.swift
//  Shopping
//
//  Created by Mohammed Saleh on 21/01/2025.
//

import Foundation
import UIKit


struct FAQ {
    
    let question: String
    let answer: String
    var isExpanded: Bool
    let answerNumber: Int
    
    var image: UIImage {
        if isExpanded {
            return UIImage(named: Images.Chevron_down.names) ?? UIImage()
        } else {
            return UIImage(named: Images.Chevron_up.names) ?? UIImage()
        }
    }
}
