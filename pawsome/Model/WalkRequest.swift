//
//  WalkRequest.swift
//  Pawsome
//
//  Created by Roch on 04/04/2022.
//

import Foundation

struct WalkRequest : Codable {
    let id: Int
    let uuid: String
    var owner: Profile?
    var animal: Animal?
    var walker: Profile?
    var notice: Notice?
    var request_status: String?
    var owner_approved_at: String?
    var owner_rejected_at: String?
    var walker_requested_at: String?
    var walker_rejected_at: String?
    var completed_at: String?
    var comment: String?
    var created_at: String?
}
