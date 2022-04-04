//
//  StaticPage.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import Foundation


struct StaticPage: Codable {
    var name: String
    var description: String
}

enum EStaticPage: String {
    case termsAndCondition = "terms-and-condition"
    case privacyPolicy = "privacy-policy"
    case aboutUs = "about-us"
}
