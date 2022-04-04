//
//  Profile.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import UIKit

struct Profile: Codable {
    var id: Int
    var uuid: String
    var user_type_id: String
    var name: String
    var email: String
    var formatted_image_url: String
    var experience: String
    var average_rating: String
    var is_available: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case uuid
        case user_type_id
        case name
        case email
        case formatted_image_url
        case experience = "years_of_experience"
        case average_rating
        case is_available
    }
}