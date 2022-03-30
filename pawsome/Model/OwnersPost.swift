//
//  OwnersPost.swift
//  pawsome
//
//  Created by Nisha Bhattarai on 2022-03-29.
//

import Foundation

struct OwnersPost: Codable {
    var _id: String
    var message: String
    var userId:String
    var userName: String!
    var createdDate: String
}

