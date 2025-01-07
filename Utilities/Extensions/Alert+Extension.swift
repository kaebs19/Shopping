//
//  Alert+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 06/01/2025.
//

import UIKit
import Foundation
import SwiftMessages

extension UIAlertController {
    func showConfirmationMessage(title: String, message: String, theme: Theme, actions: [UIAlertAction]? = nil) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(theme)
        view.configureDropShadow()
        view.configureContent(title: title, body: message)
        view.button?.isHidden = true

        // تقليل حجم الرسالة
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        // تعيين قيود لحجم الخلفية (backgroundView)
        NSLayoutConstraint.activate([
            view.backgroundView.widthAnchor.constraint(equalToConstant: 330),  // العرض
            view.backgroundView.heightAnchor.constraint(equalToConstant: 200) // الارتفاع
        ])
        
        // استخدام StackView لتنسيق الأزرار
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        if let actions = actions {
            for action in actions {
                let button = UIButton(type: .system)
                button.setTitle(action.title, for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = action.title == "نعم" ? .systemGreen : .systemRed
                button.layer.cornerRadius = 8
                button.clipsToBounds = true
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                button.tag = actions.firstIndex(of: action) ?? 0
                stackView.addArrangedSubview(button)
            }
        }

        // إضافة StackView إلى الرسالة
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 44)
        ])

        // إعداد مدة ظهور الرسالة
        var config = SwiftMessages.defaultConfig
        config.duration = .seconds(seconds: 5) // الرسالة تظهر لمدة 5 ثوانٍ
        SwiftMessages.show(config: config, view: view)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        SwiftMessages.hide()
    }
}

extension UIAlertAction {
    func callActionHandler() {
        if let handler = self.value(forKey: "handler") as? (UIAlertAction) -> Void {
            handler(self)
        }
    }
}
