//
//  Image+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 06/01/2025.
//

import Foundation
import UIKit


    extension UIImageView {
        
        /// Adds a border around the image view
        func addBarder(color: Colors = .C161616, width: CGFloat) {
            self.layer.borderColor = color.uiColor?.cgColor
            self.layer.borderWidth = width
        }
        /// Makes the image circular. Optionally specify a radius or let it calculate automatically
        func  addMakeCircularImage(radius: CGFloat? = nil) {
            self.layer.cornerRadius = radius ?? (self.frame.size.width / 2)
            self.layer.masksToBounds = true
        }
        
        func addCircleImage() {
            self.layer.cornerRadius = self.frame.size.width / 2
            self.layer.masksToBounds = true
        }
        
        func addShadow(color: Colors = .C161616 , opacity: Float = 0.5, offset: CGSize = CGSize(width: 0, height: 2) , radius: CGFloat = 4) {
            
            self.layer.shadowColor = color.uiColor?.cgColor
            self.layer.shadowOpacity = opacity
            self.layer.shadowOffset = offset
            self.layer.shadowRadius = radius
            self.layer.masksToBounds = false
        }
        
        /// Adds a gradient overlay to the image view
        func addGradientOverlay(Color: ColorsBackground , locations: [NSNumber]? = nil) {
            
        }
        
        /// Saves the current dimensions of the image
        func getImageSize() -> CGSize? {
            return self.image?.size
        }
        
        /// Resizes the image view to a specific width and height
        func resizeImageView(to size: CGSize) {
            self.frame.size = size
        }
        
        /// Blur Effect
        func addBlurEffect(style: UIBlurEffect.Style = .light) {
            let blurEffect = UIBlurEffect(style: style)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(blurEffectView)
        }
        
        /// Add Fliter
        func applyFilter(filterName: String) -> UIImage? {
            guard let image = self.image else { return nil }
            let context = CIContext()
            guard let filter = CIFilter(name: filterName) else { return nil }
            filter.setValue(CIImage(image: image), forKey: kCIInputImageKey)
            guard let outputImage = filter.outputImage,
                  let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
            return UIImage(cgImage: cgImage)
        }
        
        /// Add Mask
        func applyMask(maskImage: UIImage) {
            let maskLayer = CALayer()
            maskLayer.contents = maskImage.cgImage
            maskLayer.frame = self.bounds
            self.layer.mask = maskLayer
            self.layer.masksToBounds = true
        }
        
        /// Add  Animation
        func addAnimateBounce(duration: TimeInterval = 0.5, scale: CGFloat = 1.1) {
            UIView.animate(withDuration: duration, animations: {
                self.transform = CGAffineTransform(scaleX: scale, y: scale)
            }) { _ in
                UIView.animate(withDuration: duration) {
                    self.transform = CGAffineTransform.identity
                }
            }
        }
    }
