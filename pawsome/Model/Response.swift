//
//  Response.swift
//  pawsome
//
//  Created by Roch on 27/03/2022.
//

import Foundation

struct ApiResponse<T: Codable>: Codable {
    
    var isSuccess: Bool
    var data: T?
    var message: String
}

