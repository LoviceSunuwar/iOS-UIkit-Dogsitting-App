//
//  NSUserDefault.swift
//  Pawsome
//
//  Created by Roch on 9/18/20.
//  Copyright © 2020 Cyclone Nepal Info Tech. All rights reserved.
//

import Foundation


class NSLoginManager {
    
    static func isOwner() -> Bool {
        let isOwner = GlobalConstants.KeyValues.isOwner ?? false
        return isOwner
    }
    
    static func isLoggedIn() -> Bool {
        let apiToken = GlobalConstants.KeyValues.token ?? ""
        return !apiToken.isEmpty
    }
    
    static func clearLogSessions() {
        NSUserDefault.clearAsNeeded()
    }
    
}
