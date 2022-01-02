//
//  TagCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct TagCreateBody: Codable {
    public var id: ObjectId?
    public var name: String
    public var type: String
    public var image: URL?
    public var value: String
    public var valueType: TagValueType
    public var building: ObjectId
    public var group: String?
    public var link: URL?
    public var sortIndex: Int?
    public var alarm: Alarm?
    public var action: ObjectId?
    public var claim: ObjectId
    public var appearance: ObjectId?
    public var behaviour: ObjectId?
    public var radio: [String]?
    public var alarmShow: Bool
    public var tagid: Int
    
    public init(id: ObjectId?, name: String, type: String, image: URL?, value: String, valueType: TagValueType, building: ObjectId, group: String?, link: URL?, sortIndex: Int?, alarm: Alarm?, action: ObjectId?, claim: ObjectId, appearance: ObjectId?, behaviour: ObjectId?, radio: [String]?, alarmShow: Bool, tagid: Int) {
        self.id = id
        self.name = name
        self.type = type
        self.image = image
        self.value = value
        self.valueType = valueType
        self.building = building
        self.group = group
        self.link = link
        self.sortIndex = sortIndex
        self.alarm = alarm
        self.action = action
        self.claim = claim
        self.appearance = appearance
        self.behaviour = behaviour
        self.radio = radio
        self.alarmShow = alarmShow
        self.tagid = tagid
    }
}

public extension TagCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}

public extension TagCreateBody {
    static func createBody(from tagLegacy: TagResponseLegacy) -> TagCreateBody {
        let newLink: URL?
        if let link = tagLegacy.link {
            newLink = URL(string: link)
        } else {
            newLink = nil
        }
        return TagCreateBody(id: tagLegacy.id, name: tagLegacy.name, type: tagLegacy.type, image: tagLegacy.image, value: tagLegacy.value, valueType: tagLegacy.valueType, building: tagLegacy.building.id, group: tagLegacy.group, link: newLink, sortIndex: tagLegacy.sortIndex, alarm: tagLegacy.alarm, action: tagLegacy.action?.id, claim: tagLegacy.claim.id, appearance: tagLegacy.appearance?.id, behaviour: tagLegacy.behaviour?.id, radio: tagLegacy.radio, alarmShow: tagLegacy.alarmShow, tagid: tagLegacy.tagid)
    }
}
