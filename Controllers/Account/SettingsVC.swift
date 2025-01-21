//
//  SettingsVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 20/01/2025.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet  var mainView: [UIView]!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var notificationButton: UIButton!
    
    @IBOutlet weak var offAndOnNotification: UIMenu!
    
    // MARK: - UI Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

// MARK: - UI Setup

extension SettingsVC {
    
    func setupUI() {
        customNavigationBar(items: [.MENU , .CART], title: .none)
        titleLabel.customLabel(text: Libs.Settings.textLib, color: .C161616, size: .size_20 , typeFont: .bold)
        mainView.forEach { view in
            view.addBorder(color: .CE6E6E6, width: 1)
            view.addRadius(radius: 20)
        }
        let textsLables = [Libs.email.textLib , Libs.password.textLib , Libs.Notification.textLib]
        [emailLabel, passwordLabel, notificationLabel].enumerated().forEach { index, label in
            label?.customLabel(text: textsLables[index], color: .C161616, size: .size_12)
        }
        let textsFields = [TextFields.email , TextFields.password]
        [emailTextField, passwordTextField].enumerated().forEach { index , textField in
            textField.customTextField(placeholder: textsFields[index],placeholderColor: .CF7F7F7,textColor: .C161616 , ofSize: .size_16)
        }
        setupNotificationMenu()
    }
    
    private func setupNotificationMenu() {
        
        let largeFont = UIFont.systemFont(ofSize: 18 , weight: .bold)
        
        let onAction = UIAction(title: Libs.ON.textLib, image: UIImage(systemName: "checkmark.circle")) { _ in
            self.notificationButton.setTitle(Libs.ON.textLib, for: .normal)
            print("Notifications turned ON")
        }
        
        let attributedOnTitle = NSAttributedString(string: Libs.ON.textLib, attributes: [
            .font: largeFont ,
            .foregroundColor: UIColor.black
        ])
        
    
        
        let offAction = UIAction(title: Libs.OFF.textLib, image: UIImage(systemName: "xmark.circle")) { _ in
            self.notificationButton.setTitle(Libs.OFF.textLib, for: .normal)
            print("Notifications turned OFF")
        }
        
        let attributedOffTitle = NSAttributedString(string: Libs.OFF.textLib, attributes: [
            .font: largeFont ,
            .foregroundColor: UIColor.black
        ])
        
        onAction.setValue(attributedOnTitle, forKey: "attributedTitle")
        offAction.setValue(attributedOffTitle, forKey: "attributedTitle")
        
        
        notificationButton.titleLabel?.font = UIFont.systemFont(ofSize: 18 , weight: .medium)
        notificationButton.contentVerticalAlignment = .center
        notificationButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        notificationButton.sizeToFit()
        let menu = UIMenu(title: isEnglish() ? "Notification Settings" : "إعدادات الإشعارات" , options: .displayInline, children: [onAction, offAction])
        notificationButton.menu = menu
        notificationButton.showsMenuAsPrimaryAction = true
        
    }
}
