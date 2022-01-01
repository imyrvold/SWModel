//
//  TagCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct TagCreateBody: Encodable {
    public var id: ObjectId?
    public var name: String
    public var type: String
    public var image: URL?
    public var value: String
    public var valueType: TagValueType
    public var buildingID: ObjectId
    public var group: String?
    public var link: URL?
    public var sortIndex: Int?
    public var alarm: Alarm?
    public var actionID: ObjectId?
    public var claimID: ObjectId
    public var appearanceID: ObjectId?
    public var behaviourID: ObjectId?
    
    public init(id: ObjectId?, name: String, type: String, image: URL?, value: String, valueType: TagValueType, buildingID: ObjectId, group: String?, link: URL?, sortIndex: Int?, alarm: Alarm?, actionID: ObjectId?, claimID: ObjectId, appearanceID: ObjectId?, behaviourID: ObjectId?) {
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
        return TagCreateBody(id: tagLegacy.id, name: tagLegacy.name, type: tagLegacy.type, image: tagLegacy.image, value: tagLegacy.value, valueType: tagLegacy.valueType, buildingID: tagLegacy.building.id, group: tagLegacy.group, link: newLink, sortIndex: tagLegacy.sortIndex, alarm: tagLegacy.alarm, actionID: tagLegacy.action?.id, claimID: tagLegacy.claim.id, appearanceID: tagLegacy.appearance?.id, behaviourID: tagLegacy.behaviour?.id)
    }
}
