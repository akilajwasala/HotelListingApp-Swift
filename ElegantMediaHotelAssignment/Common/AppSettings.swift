//
//  AppSettings.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/7/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit

class AppSettings {
    private static let defaults = UserDefaults.standard

    struct ParamNames {
        static let UserName = "user_name"
        static let Email = "email"
    }
    
    static func setUserName(name: String?) {
        defaults.set(name, forKey: ParamNames.UserName)
        defaults.synchronize()
    }
    
    static func getUserName() -> String? {
        return defaults.string(forKey: ParamNames.UserName)
    }

    static func setUserEmail(email: String?) {
        defaults.set(email, forKey: ParamNames.Email)
        defaults.synchronize()
    }
    
    static func getUserEmail() -> String? {
        return defaults.string(forKey: ParamNames.Email)
    }

}
