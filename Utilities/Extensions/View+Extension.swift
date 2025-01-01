//
//  View+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 01/01/2025.
//

import Foundation
import UIKit


import UIKit

extension UIView {
    
    /// Applies a corner radius to the view.
    /// يُطبق نصف قطر زاوية على العرض.
    func addRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    /// Adds a border to the view.
    /// يُضيف حدودًا إلى العرض.
    func addBoder(color: Colors, width: CGFloat) {
        self.layer.borderColor = color.uiColor?.cgColor
        self.layer.borderWidth = width
    }

    /// Applies a corner radius to specific corners of the view.
    /// يُطبق نصف قطر زاوية على زوايا محددة من العرض.
    func addMaskCorners(radius: CGFloat , corners: [cornerMask]) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = CACornerMask(corners.map{$0.corner})
    }
    
    
    /// Adds a shadow to the view.
    /// يُضيف ظلًا إلى العرض.
    ///
    /// - Parameters:
    ///   - color: The color of the shadow.
    ///            لون الظل.
    ///   - opacity: The opacity of the shadow (range: 0.0 to 1.0).
    ///              شفافية الظل (من 0.0 إلى 1.0).
    ///   - radius: The blur radius of the shadow.
    ///             نصف قطر التموج (الضبابية) للظل.
    ///   - offset: The offset of the shadow (horizontal and vertical).
    ///             إزاحة الظل (أفقيًا وعموديًا).

    func addShadow(color: Colors = .CE6E6E6, opacity: Float = 0.5, radius: CGFloat = 4.0, offset: CGSize = CGSize(width: 2, height: 2)) {
        self.layer.shadowColor = color.uiColor?.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    /// Defines the corners of a view.
    /// يُحدد زوايا العرض.
    enum cornerMask {
        /// The top-left corner.
        case topLeftCorner
        /// The top-right corner.
        case topRightCorner
        /// The bottom-left corner.
        case bottomLeftCorner
        /// The bottom-right corner.
        case bottomRightCorner
        /// Returns the corresponding `CACornerMask` value.
        var corner: CACornerMask {
            switch self {
                case .topLeftCorner: return .layerMinXMinYCorner
                case .topRightCorner: return .layerMaxXMinYCorner
                case .bottomLeftCorner: return .layerMaxXMaxYCorner
                case .bottomRightCorner: return .layerMinXMaxYCorner
            }
        }
    }
}
