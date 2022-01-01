//
//  BehaviourCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct BehaviourCreateBody: Codable {
    public var id: ObjectId?
    public var name: String
    public var min: Int?
    public var max: Int?
    public var numberOfDecimals: Int?
    public var orientation: Orientation?
    public var step: Int?
    public var options: [String]?
    
    public init(id: ObjectId?, name: String, min: Int? = nil, max: Int? = nil, numberOfDecimals: Int? = nil, orientation: Orientation? = nil, step: Int? = nil, options: [String]? = nil) {
        self.id = id
        self.name = name
        self.min = min
        self.max = max
        self.numberOfDecimals = numberOfDecimals
        self.orientation = orientation
        self.step = step
        self.options = options
    }
}

public extension BehaviourCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}

public extension BehaviourCreateBody {
    static func createBody(from behaviourLegacy: BehaviourResponseLegacy) -> BehaviourCreateBody {
        BehaviourCreateBody(id: behaviourLegacy.id, name: behaviourLegacy.name, min: behaviourLegacy.min, max: behaviourLegacy.max, numberOfDecimals: behaviourLegacy.numberOfDecimals, orientation: behaviourLegacy.orientation, step: behaviourLegacy.step, options: behaviourLegacy.options)
    }
}
