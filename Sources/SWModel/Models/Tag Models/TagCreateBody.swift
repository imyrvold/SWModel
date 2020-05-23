//
//  TagCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct TagCreateBody: Encodable {
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
}
