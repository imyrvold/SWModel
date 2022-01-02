//
//  TagDeleteResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct TagDeleteResponse {
    public let id: ObjectId
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
    public var claimID: String
    public var appearanceID: String?
    public var behaviourID: String?
    public var radio: [String]?
    public var alarmShow: Bool
    public var tagid: Int
    
    public init(id: ObjectId, name: String, type: String, image: URL?, value: String, valueType: TagValueType, buildingID: String, group: String?, link: URL?, sortIndex: Int?, alarm: Alarm?, actionID: String?, claimID: String, appearanceID: String?, behaviourID: String?, radio: [String]?, alarmShow: Bool, tagid: Int) {
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
        self.radio = radio
        self.alarmShow = alarmShow
        self.tagid = tagid
    }

}
extension TagDeleteResponse: Decodable {
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
        case radio
        case alarmShow
        case tagid
    }
}
