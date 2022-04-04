//
//  NSUserDefault.swift
//  Pawsome
//
//  Created by Roch on 8/30/20.
//  Copyright © 2020 Roch. All rights reserved.
//

import Foundation

import Foundation

class NSUserDefault {
    
    enum defaultType:String {
        case fcmToken           = "fcmToken"
        case userId             = "com.roch.friends.userId"
        case user_type_id       = "com.roch.friends.user_type_id"
        case name               = "com.roch.friends.name"
        case email              = "com.roch.friends.email"
        case formatted_image_url = "com.roch.friends.formatted_image_url"
        case experience         = "com.roch.friends.experience"
        case average_rating     = "com.roch.friends.average_rating"
        case is_available       = "com.roch.friends.is_available"
    }
    
    class func set(data:Any, forKey :defaultType) {
        UserDefaults().setValue(data, forKey: forKey.rawValue)
        UserDefaults().synchronize()
    }
    
    class func get(forKey key:defaultType) -> Any? {
        return UserDefaults().object(forKey: key.rawValue)
    }
    
    class func isAvailable(forKey key:defaultType) -> Bool {
        guard let _ = UserDefaults().object(forKey: key.rawValue) else { return false }
        return true
    }
    
    class func clear(_ type:defaultType? = nil) {
        if let _type = type {
            /*   Clean specific NSUserDefault data  */
            UserDefaults().removeObject(forKey: _type.rawValue)
        }else{
            /*   Clean all NSUserDefault datas   */
            guard let appDomain = Bundle.main.bundleIdentifier else { return }
            UserDefaults().removePersistentDomain(forName: appDomain)
        }
    }
    
    class func clearAsNeeded() {
        GlobalConstants.KeyValues.userType = nil
        GlobalConstants.KeyValues.token = nil
    }
    
}
