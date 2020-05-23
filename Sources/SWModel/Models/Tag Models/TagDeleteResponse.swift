//
//  TagDeleteResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct TagDeleteResponse {
    let id: String
    var name: String
    var type: String
    var image: URL?
    var value: String
    var valueType: TagValueType
    var buildingID: String
    var group: String?
    var link: URL?
    var sortIndex: Int?
    var alarm: Alarm?
    var actionID: String?
    var claimID: String
    var appearanceID: String?
    var behaviourID: String?
}
extension TagDeleteResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case type
        case image
        case value
        case valueType
        case buildingID
        case group
        case link
        case sortIndex
        case alarm
        case actionID
        case claimID
        case appearanceID
        case behaviourID
    }
}
