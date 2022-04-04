//
//  GlobalConstraint.swift
//  Pawsome
//
//  Created by Roch on 3/22/22.
//

import Foundation

struct GlobalConstants {
    struct KeyValues {
        static var isOnboardingPreviouslyOpened: Bool? {
            get {
                return UserDefaults.standard.bool(forKey: GlobalConstants.UserDefaultKey.isOnboardingPreviouslyOpened)
            }
            set {
                UserDefaults.standard.set(newValue, forKey: GlobalConstants.UserDefaultKey.isOnboardingPreviouslyOpened)
            }
        }
        
        static var userType: EUserType? {
            get {
                let intValue = UserDefaults.standard.string(forKey: GlobalConstants.UserDefaultKey.eUserType)
                return EUserType.init(rawValue: intValue ?? "0")
            }
            set {
                UserDefaults.standard.set(newValue?.rawValue, forKey: GlobalConstants.UserDefaultKey.eUserType)
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
        static let isOnboardingPreviouslyOpened = "isOnboardingPreviouslyOpened"
        static let isOwner = "isOwner"
        static let token = "apiToken"
        static let eUserType = "user_type"
    }
}
