//
//  Profile.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import UIKit

enum EUserType: Int {
    case owner = 2
    case walker = 3
}

struct Profile: Codable {
    var id: Int?
    var uuid: String?
    var user_type_id: Int?
    var name: String?
    var email: String?
    var phone_number: String?
    var formatted_image_url: String?
    var experience: String?
    var average_rating: Double?
    var is_available: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case uuid
        case user_type_id
        case name
        case email
        case phone_number = "mobile_number"
        case formatted_image_url
        case experience = "years_of_experience"
        case average_rating
        case is_available
    }
    
    func getUserType() -> EUserType {
        return EUserType.init(rawValue: self.user_type_id ?? 0) ?? .owner
    }
}
