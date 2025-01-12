//
//  TabBar+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 09/01/2025.
//

import Foundation
import UIKit

extension UITabBar {
    /// Adds shadow and border styling to the Tab Bar.
    /// يضيف ظلاً وحدوداً لشريط التبويب.

    func addShadowToTabBar() {
        self.layer.shadowColor = Colors.CEEEEEE.uiColor?.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: -2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
        self.addRadius(radius: 18)
        self.addBorder(color: Colors.CEEEEEE, width: 1)
        self.unselectedItemTintColor = Colors.C867F7F.uiColor
    }
    
    /// Customizes the icons and titles for the Tab Bar items.
    /// يخصص الأيقونات والعناوين لعناصر شريط التبويب.
    func customizeTabBarIconsAndTitles(tabBarItems: [TabBarItemConfig]) {
        guard let items = self.items, items.count == tabBarItems.count else { return }
        
        for (index, item) in items.enumerated() {
            let config = tabBarItems[index]
            item.title = config.title.rawValue.localized
            item.image = UIImage(named: config.unselectedImage.names)
            item.selectedImage = UIImage(named: config.selectedImage.names)
        }
    }

    /// Applies a custom font to the Tab Bar item titles.
    /// يطبق خطاً مخصصاً على عناوين عناصر شريط التبويب.
    func appFont(font: Fonts) {
        for item in self.items ?? [] {
            item.setTitleTextAttributes(
                [NSAttributedString.Key.font: UIFont(name: font.typeFont.localized, size: 10)!],
                for: .normal
            )
        }
    }

    /// Adjusts the position of Tab Bar icons.
    /// يضبط مواضع أيقونات شريط التبويب.
    func adjustIconPositions() {
        guard let items = self.items else { return }
        let offset: CGFloat = -2 // قيمة الرفع
        for item in items {
            item.imageInsets = UIEdgeInsets(top: offset, left: 0, bottom: -5, right: 0)
        }
    }
    /// Adds badges to the Tab Bar icons with optional animations.
    /// يضيف شارات إلى أيقونات شريط التبويب مع تأثيرات اختيارية.
    func addBadgesToIcons() {
           // guard let items = tabBar.items else { return }
            // إضافة تاشيرات إلى الأيقونات
        }

}
