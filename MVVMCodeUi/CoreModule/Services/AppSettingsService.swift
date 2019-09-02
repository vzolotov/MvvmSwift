//
//  SettingsService.swift
//  MVVMCodeUi
//
//  Created by slava zolotov on 31/08/2019.
//  Copyright © 2019 slava zolotov. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class AppSettingsService : AppSettingsProtocol{
    
    private let userDefaults = UserDefaults.standard
    
    var Token: String{
        set{
            KeychainWrapper.standard.set(newValue, forKey: "Token")
        }
        get{
            return KeychainWrapper.standard.string(forKey: "Token") ?? ""
        }
    }
    var isFirstLaunch : Bool{
        set{
            userDefaults.set(newValue, forKey: "isFirstLaunch")
        }
        get{
            return userDefaults.bool(forKey: "isFirstLaunch")
        }
    }
    
    var isAuth : Bool{
        set{
            userDefaults.set(newValue, forKey: "isFirstLaunch")
        }
        get{
            return userDefaults.bool(forKey: "isFirstLaunch")
        }
    }
}
