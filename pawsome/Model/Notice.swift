//
//  Notice.swift
//  Pawsome
//
//  Created by Roch on 4/4/22.
//

import Foundation


struct Notice : Codable {
    let id: Int?
    var owner: Profile?
    var animal: Animal?
    var notice_title: String?
    var notice_description: String?
    var requested_date_time: String?
    var rating: Double?
    var created_at: String?
}
