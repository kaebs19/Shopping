//
//  ViewControllers+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 02/01/2025.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// Navigates to the next view controller.
    /// ينتقل إلى واجهة المستخدم التالية.
    func gotToNextVC(storyboard: Storyboards = .Main , identifier: Identifiers , presentationStyle: PresentationStyle = .push){
        let sb = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        if let vc = sb.instantiateViewController(withIdentifier: identifier.rawValue) as? UIViewController {
            
            UIView.transition(with: self.view, duration: 0.5, options: .transitionFlipFromRight) {
                switch presentationStyle {
                    case .push: self.navigationController?.pushViewController(vc, animated: true)
                    case .present:  self.present(vc, animated: true)
                }
                
            }
            
        } else {
            print("Error: ViewController with identifier \(identifier.rawValue) not found")
        }
    }
    
    /// Navigates to the previous view controller.
    /// ينتقل إلى واجهة المستخدم السابقة.
    func gotToPreviousVC(){
        navigationController?.popViewController(animated: true)
    }
    
    
    /// Defines the presentation style for navigation.
    /// يُحدد أسلوب العرض للتنقل.
    enum PresentationStyle {
        case push
        case present
    }
    
    func isHideNavigationBar(hide: Bool = true){
        navigationController?.isNavigationBarHidden = hide
    }

    
}
