//
//  Animal.swift
//  Pawsome
//
//  Created by Roch on 4/4/22.
//

import Foundation


struct Animal: Codable {
    let id: Int
    let animal_name: String?
    let animal_image_url: String?
    let animal_slug: String?
    let date_of_birth: String?
    let breed_type: String?
    let is_walking: Bool?
}
