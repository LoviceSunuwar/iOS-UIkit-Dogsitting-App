//
//  Response.swift
//  pawsome
//
//  Created by Roch on 27/03/2022.
//

struct ApiResponse<T: Codable>: Codable {
    
    var status: Bool
    var data: T?
    var message: String
    var token: String?
    var status_code: Int
}


