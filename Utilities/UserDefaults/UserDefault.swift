//
//  UserDefault.swift
//  Shopping
//
//  Created by Mohammed Saleh on 09/01/2025.
//

import UIKit

class UserDefault {
    // MARK: - Singleton Instance
    static let shared = UserDefault()
    private init() {}   // منع إنشاء أكثر من نسخة
    
    private let defaults = UserDefaults.standard
    
    
    // MARK: - Keys
    private enum keys {
        static let isLongin: String = "isLongin"
        static let isLanguage: String = "isLanguage"
    }
    
    
    // MARK: - Variables & Constants
    var isLogin: Bool {
        get { defaults.bool(forKey: keys.isLongin)}
        set { defaults.set(newValue, forKey: keys.isLongin)}
    }
    
    var isLanguage: Bool {
        get { isEnglish()}
        set { defaults.set(newValue, forKey: keys.isLanguage)}
    }
    
    // MARK: - Store Data
    func stroreData(key: String , value: Any) -> Any? {
        
        switch key {
            case keys.isLongin:
                if let boolValue = value as? Bool {
                    isLogin = boolValue
                    return isLogin
                }
                
            case keys.isLanguage:
                if let boolBalue = value as? Bool {
                    isLanguage = boolBalue
                    return isLanguage
                }
                
            default:
                return nil
        }
        
        return nil
    }
    
    // MARK: - Get Stored Data
    func getStoredData(key: String) -> Any? {
        
        switch key {
            case keys.isLongin:
                return isLogin
                
            case keys.isLanguage:
                return isLanguage
                
            default :
                return nil
        }
    }
    
    // MARK: - Logout (Clear Data)
    func logout() {
        defaults.removeObject(forKey: keys.isLongin)
        defaults.removeObject(forKey: keys.isLanguage)
    }
}
