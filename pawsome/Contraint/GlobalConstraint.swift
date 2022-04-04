//
//  GlobalConstraint.swift
//  Pawsome
//
//  Created by Roch on 3/22/22.
//

import Foundation

struct GlobalConstants {
    struct KeyValues {
        static var isWalkthroughPreviouslyOpened: Bool? {
            get {
                return UserDefaults.standard.bool(forKey: GlobalConstants.UserDefaultKey.isWalkthroughPreviouslyOpened)
            }
            set {
                UserDefaults.standard.set(newValue, forKey: GlobalConstants.UserDefaultKey.isWalkthroughPreviouslyOpened)
            }
        }
        
        static var isOwner: Bool? {
            get {
                return UserDefaults.standard.bool(forKey: GlobalConstants.UserDefaultKey.isOwner)
            }
            set {
                UserDefaults.standard.set(newValue, forKey: GlobalConstants.UserDefaultKey.isOwner)
            }
        }
        
        static var token: String? {
            get {
                return UserDefaults.standard.string(forKey: GlobalConstants.UserDefaultKey.token)
            }
            set {
                UserDefaults.standard.set(newValue, forKey: GlobalConstants.UserDefaultKey.token)
            }
        }
    }
    
    // MARK: UserDefaultKey
    struct UserDefaultKey {
        static let isWalkthroughPreviouslyOpened = "isWalkthroughPreviouslyOpened"
        static let isOwner = "isOwner"
        static let token = "apiToken"
    }
}
