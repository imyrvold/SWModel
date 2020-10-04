//
//  TagResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct TagResponse {
    public var id: String
    public var name: String
    public var type: String
    public var image: URL?
    public var value: String
    public var valueType: TagValueType
    public var buildingID: String
    public var group: String?
    public var link: URL?
    public var sortIndex: Int?
    public var alarm: Alarm?
    public var actionID: String?
    public var claimID: ObjectId
    public var appearanceID: ObjectId?
    public var behaviourID: String?
    
    public init(id: String, name: String, type: String, image: URL?, value: String, valueType: TagValueType, buildingID: String, group: String?, link: URL?, sortIndex: Int?, alarm: Alarm?, actionID: String?, claimID: ObjectId, appearanceID: ObjectId?, behaviourID: String?) {
        self.id = id
        self.name = name
        self.type = type
        self.image = image
        self.value = value
        self.valueType = valueType
        self.buildingID = buildingID
        self.group = group
        self.link = link
        self.sortIndex = sortIndex
        self.alarm = alarm
        self.actionID = actionID
        self.claimID = claimID
        self.appearanceID = appearanceID
        self.behaviourID = behaviourID
    }

}
extension TagResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
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
