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
    
//    enum defaultType:String {
//        case fcmToken           = "fcmToken"
//    }
//    
//    class func set(data:Any, forKey :defaultType) {
//        UserDefaults().setValue(data, forKey: forKey.rawValue)
//        UserDefaults().synchronize()
//    }
//    
//    class func get(forKey key:defaultType) -> Any? {
//        return UserDefaults().object(forKey: key.rawValue)
//    }
//    
//    class func isAvailable(forKey key:defaultType) -> Bool {
//        guard let _ = UserDefaults().object(forKey: key.rawValue) else { return false }
//        return true
//    }
//    
//    class func clear(_ type:defaultType? = nil) {
//        if let _type = type {
//            /*   Clean specific NSUserDefault data  */
//            UserDefaults().removeObject(forKey: _type.rawValue)
//        }else{
//            /*   Clean all NSUserDefault datas   */
//            guard let appDomain = Bundle.main.bundleIdentifier else { return }
//            UserDefaults().removePersistentDomain(forName: appDomain)
//        }
//    }
    
    class func clearAsNeeded() {
        GlobalConstants.KeyValues.isOwner = nil
        GlobalConstants.KeyValues.token = nil
    }
    
}
