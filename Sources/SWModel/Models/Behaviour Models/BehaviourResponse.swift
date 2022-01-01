//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 01/01/2022.
//

import Foundation
import BSON

public struct BehaviourResponse: Codable {
    public var id: ObjectId?
    public var name: String
    public var min: Int?
    public var max: Int?
    public var numberOfDecimals: Int?
    public var orientation: Orientation?
    public var step: Int?
    public var options: [String]?
    public var updatedAt: Date?
    public var createdAt: Date?
    public var deletedAt: Date?
    
    init(id: ObjectId?, name: String, min: Int?, max: Int?, numberOfDetails: Int?, orientation: Orientation?, step: Int?, options: [String]?, createdAt: Date?, updatedAt: Date?, deletedAt: Date?) {
        self.id = id
        self.name = name
        self.min = min
        self.max = max
        self.numberOfDecimals = numberOfDetails
        self.orientation = orientation
        self.step = step
        self.options = options
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
    
    public init(from behaviour: Behaviour) {
        self.init(id: behaviour.id, name: behaviour.name, min: behaviour.min, max: behaviour.max, numberOfDetails: behaviour.numberOfDecimals, orientation: behaviour.orientation, step: behaviour.step, options: behaviour.options, createdAt: behaviour.createdAt, updatedAt: behaviour.updatedAt, deletedAt: behaviour.deletedAt)
    }
}
