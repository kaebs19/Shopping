//
//  ViewControllers+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 02/01/2025.
//

import Foundation
import UIKit
import SwiftMessages
import SideMenu


extension UIViewController {
    
    
    /// Navigates to the next view controller.
    /// ينتقل إلى واجهة المستخدم التالية.
    func gotToNextVC(storyboard: Storyboards = .TabBars , identifier: Identifiers , presentationStyle: PresentationStyle = .push){
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
    
    /// Hides the keyboard and adds a tap gesture to dismiss it.
    /// يُخفي لوحة المفاتيح ويضيف إيماءة نقر لإغلاقها.
    func hideKeyboard(){
        view.endEditing(true)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    /// Dismisses the keyboard.
    /// يُغلق لوحة المفاتيح.
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
        
    }
    
    /// Displays a message to the user using SwiftMessages library.
    /// يعرض رسالة للمستخدم باستخدام مكتبة SwiftMessages.
    ///
    /// - Parameters:
    ///   - title: The title of the message.
    ///             عنوان الرسالة.
    ///   - message: The body of the message.
    ///              نص الرسالة.
    ///   - theme: The theme of the message (e.g., success, error, warning).
    ///            سمة الرسالة (مثل نجاح، خطأ، تحذير).
    
    func showMessage(title:String , message: String, thme:Theme){
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(thme)
        // Add a drop shadow.
        view.configureDropShadow()
        view.configureContent(title: title, body: message)
        
        // Increase the external margin around the card. In general, the effect of this setting
        // depends on how the given layout is constrained to the layout margins.
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        // Reduce the corner radius (applicable to layouts featuring rounded corners).
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        view.button?.isHidden = true
        // Show the message.
        SwiftMessages.show(view: view)
    }
    
    func hideOrShowTabBar(hide: Bool = true) {
        self.tabBarController?.tabBar.isHidden = hide
        self.tabBarController?.tabBar.isTranslucent = hide
    }

    
    /// Checks if the email is in a valid format.
    /// يتحقق مما إذا كان البريد الإلكتروني بتنسيق صحيح.
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    /// Checks if the password meets the strength requirements.
    /// يتحقق مما إذا كانت كلمة المرور تلبي متطلبات القوة.
    func isValidPassword(_ password: String) -> Bool {
        // مثال: كلمة المرور يجب أن تكون على الأقل 6 أحرف
        return password.count >= 6
    }
    
    func customNavigationBar(items: [NavigationBar] , title: Titles?) {
        
        var rightBar: [UIBarButtonItem] = []
        var leftBar: [UIBarButtonItem] = []
        
        for item in items {
            
            switch item {
                    
                case .MENU:
                    leftBar.append(UIBarButtonItem(image: UIImage(named: Images.Menu.names)?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(showMenuButTappes)))
                case .CART:
                    rightBar.append(UIBarButtonItem(image: UIImage(named: Images.Cart.names)?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(showCartButTappes)))
                case .BACK:
                    leftBar.append(UIBarButtonItem(image: UIImage(named: Images.Previous_icon.names) ?? UIImage(systemName: "arrowshape.turn.up.backward.fill"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(showBlackButTappes)))
                    leftBar.last?.tintColor = .black
                case .FLITER:
                    rightBar.append(UIBarButtonItem(image: UIImage(named: Images.Filter.names)?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(showFliterButTappes)))
            }
            
        }
        
        self.title = title?.rawValue.localized ?? ""
        
        if isEnglish() {
            navigationItem.leftBarButtonItems = leftBar
            navigationItem.rightBarButtonItems = rightBar
        } else {
            self.navigationItem.rightBarButtonItems = rightBar
            self.navigationItem.leftBarButtonItems = leftBar
            
        }
        
    }
    
    @objc func showMenuButTappes(){
        let sb = UIStoryboard(name: Storyboards.TabBars.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: Identifiers.SideMenuVC.rawValue)
        let slideMenuController = SideMenuNavigationController(rootViewController: vc)
        slideMenuController.menuWidth = UIScreen.main.bounds.width - 45
        slideMenuController.leftSide = isEnglish() ? true : false
        slideMenuController.presentationStyle = .menuSlideIn
        // إعداد الخلفية (شفافية / ظل)
        slideMenuController.presentationStyle.backgroundColor = UIColor.black
        // إضافة ظل لواجهة العرض
        slideMenuController.presentationStyle.presentingEndAlpha = 0.4
        slideMenuController.enableSwipeToDismissGesture = true
        
        if let navController =  navigationController {
            navController.parent?.present(slideMenuController, animated: true, completion: nil)
        }else {
            present(slideMenuController, animated: true, completion: nil)
        }
    }
    
    @objc func showCartButTappes(){
        gotToNextVC(identifier: .BagVc)
    }
    
    @objc func showBlackButTappes(){
        gotToPreviousVC()
    }
    @objc func showFliterButTappes(){
        
    }
    
    //     // Add buttons for Yes and No
    /// button yes
    @objc func yesButtonTapped(){
        SwiftMessages.hide()
        
    }
    
    /// button n
    @objc func noButtonTapped(){
        SwiftMessages.hide()
        
    }
    
    
}


