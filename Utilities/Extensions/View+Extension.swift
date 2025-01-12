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
    
    // MARK: - زاوية (Corner Radius) وحدود (Border)
    
    func addRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    /// Adds a border to the view.
    /// يُضيف حدودًا إلى العرض.
    func addBorder(color: Colors, width: CGFloat) {
        self.layer.borderColor = color.uiColor?.cgColor
        self.layer.borderWidth = width
    }

    // MARK: - الظل (Shadow)

    func addShadow(color: Colors = .CE6E6E6, opacity: Float = 0.5, radius: CGFloat = 4.0, offset: CGSize = CGSize(width: 2, height: 2), customPath: UIBezierPath? = nil) {
        self.layer.shadowColor = color.uiColor?.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowPath = customPath?.cgPath ?? UIBezierPath(rect: self.bounds).cgPath
    }
    
    func removShadow() {
        layer.shadowColor = nil
        layer.shadowOpacity = 0
        layer.shadowRadius = 0
        layer.shadowOffset = .zero
        layer.masksToBounds = false
    }

    
    /// Applies a corner radius to specific corners of the view.
    /// يُطبق نصف قطر زاوية على زوايا محددة من العرض.
    func addMaskCorners(radius: CGFloat , corners: [cornerMask]) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = CACornerMask(corners.map{$0.corner})
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
    
    // MARK: - شكل دائري (Circular)

    func makeCircular(radius: CGFloat? = nil) {
        
        if let radius = radius {
            self.layer.cornerRadius = radius
        } else {
            self.layer.cornerRadius = min(self.frame.width, self.frame.height) / 2.0
        }
        self.layer.masksToBounds = true
    }
    
    
    func applyBackground(style: BackgroundStyle){
        switch style {
                
            case .solid(let color):
                self.backgroundColor = color
                self.layer.sublayers?.removeAll{ $0 is CAGradientLayer}
            
            case .gradient(let colors):
                self.backgroundColor = .clear
                self.layer.sublayers?.removeAll{ $0 is CAGradientLayer}
                
                let gradientLayer = CAGradientLayer()
                gradientLayer.frame = self.bounds
                gradientLayer.colors = colors.map{ $0.cgColor}
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
                gradientLayer.cornerRadius = self.layer.cornerRadius
                self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    func configureAppearance(cornerRadius: CGFloat? = nil , gradientColors: [UIColor]? = nil) {
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
        
        if let gradientColors = gradientColors {
            self.applyBackground(style: .gradient(gradientColors))
        }
    }
    
    
    enum BackgroundStyle {
        case solid(UIColor)
        case gradient([UIColor])
    }
}
