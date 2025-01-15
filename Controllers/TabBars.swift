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
        if let userLogin = UserDefault.shared.getStoredData(key: "userLogin") {
            print("userLogin: \(userLogin)")
        }
        isHideNavigationBar()
        tabBar.addShadowToTabBar()
        tabBar.customizeTabBarIconsAndTitles(tabBarItems: tabBarItems)
        tabBar.appFont(font: .SemiBold)
        tabBar.adjustIconPositions()
    }
    
   /// إعادة تطبيق التخصيص عند إظهار TabBar
    func applyTabBarCustomization() {
        tabBar.addShadowToTabBar()
        tabBar.customizeTabBarIconsAndTitles(tabBarItems: tabBarItems)
        tabBar.appFont(font: .SemiBold)
        tabBar.adjustIconPositions()
    }

}

