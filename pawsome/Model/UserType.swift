//
//  UserType.swift
//  pawsome
//
//  Created by Roch on 28/03/2022.
//

import Foundation

struct UserType: OptionSet {
    typealias RawValue = Int
    
    static func ==(lhs: UserType, rhs: UserType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    var rawValue: UserType.RawValue
    static let owner: UserType = UserType(rawValue: 0)
    static let walker: UserType = UserType(rawValue: 1)
}
