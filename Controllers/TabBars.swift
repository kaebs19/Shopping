//
//  TabBars.swift
//  Shopping
//
//  Created by Mohammed Saleh on 03/01/2025.
//

import UIKit

class TabBars: UITabBarController {
    
    let tabBarItems: [TabBarItemConfig] = [
        TabBarItemConfig(title: .Home, selectedImage: .Home_TabBar, unselectedImage: .Home_unselected),
        TabBarItemConfig(title: .Categories, selectedImage: .Category_TabBar, unselectedImage: .Category_unselected),
        TabBarItemConfig(title: .Featured, selectedImage: .Featured_TabBar, unselectedImage: .Featured_unselected),
        TabBarItemConfig(title: .Account, selectedImage: .Account_TabBar, unselectedImage: .Account_unselected)
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension TabBars {
    /// Sets up the Tab Bar by applying custom styles and properties.
    /// يقوم بإعداد شريط التبويب وتطبيق التنسيقات والخصائص المخصصة.
    func setup() {
        isHideNavigationBar()
        addShadowToTabBar()
        customizeTabBarIconsAndTitles()
        adjustIconPositions()
        appFont(font: .SemiBold)
    }
    /// Adds shadow and border styling to the Tab Bar.
    /// يضيف ظلاً وحدوداً لشريط التبويب.

    func addShadowToTabBar() {
        tabBar.layer.shadowColor = Colors.CEEEEEE.uiColor?.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.masksToBounds = false
        tabBar.addRadius(radius: 18)
        tabBar.addBoder(color: Colors.CEEEEEE, width: 1)
        tabBar.unselectedItemTintColor = Colors.C867F7F.uiColor
    }
    
    /// Customizes the icons and titles for the Tab Bar items.
    /// يخصص الأيقونات والعناوين لعناصر شريط التبويب.
    func customizeTabBarIconsAndTitles(){
        guard let item = tabBar.items , item.count == tabBarItems.count else { return }
     
        for (index , item) in item.enumerated() {
            let config = tabBarItems[index]
            item.title =  isEnglish() ? config.title.rawValue.localized : config.title.rawValue.localized
            item.image = UIImage(named: config.unselectedImage.names)
            item.selectedImage = UIImage(named: config.selectedImage.names)
        }
}
    
    /// Applies a custom font to the Tab Bar item titles.
    /// يطبق خطاً مخصصاً على عناوين عناصر شريط التبويب.
    func appFont(font: Fonts){
        for item in tabBar.items ?? []{
            item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: font.typeFont.localized, size: 10)!], for: .normal)
        }
        
    }
    
    /// Adjusts the position of Tab Bar icons.
    /// يضبط مواضع أيقونات شريط التبويب.
    func adjustIconPositions() {
            guard let items = tabBar.items else { return }
            // رفع الأيقونات لأعلى قليلاً
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

struct TabBarItemConfig {
    let title: Titles
    let selectedImage: Imags
    let unselectedImage: Imags
}

