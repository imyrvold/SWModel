//
//  Behaviour.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public enum Orientation: String, Codable {
    case leftToRight = "left-to-right"
    case rightToLeft = "right-to-left"
}


public struct Behaviour: Codable, Identifiable, Equatable, SidebarItemable {
    public static func == (lhs: Behaviour, rhs: Behaviour) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id: ObjectId?
    public var name: String
    public var min: Int?
    public var max: Int?
    public var numberOfDecimals: Int?
    public var orientation: Orientation?
    public var options: [String]?
    public var updatedAt: Date?
    public var createdAt: Date?
    public var deletedAt: Date?
    public var menuName: NavigationItem {
        .behaviours
    }
    
    public init(id: ObjectId?, name: String, min: Int?, max: Int?, numberOfDecimals: Int?, orientation: Orientation?, options: [String]?, createdAt: Date?, updatedAt: Date?, deletedAt: Date?) {
        self.id = id
        self.name = name
        self.min = min
        self.max = max
        self.numberOfDecimals = numberOfDecimals
        self.orientation = orientation
        self.options = options
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
}

extension Behaviour: Comparable {
    public static func < (lhs: Behaviour, rhs: Behaviour) -> Bool {
        return lhs.name < rhs.name
    }
}

public extension Behaviour {
    static var empty: Behaviour {
        let date = Date()
        return Behaviour(id: nil, name: "", min: nil, max: nil, numberOfDecimals: nil, orientation: nil, options: nil, createdAt: date, updatedAt: date, deletedAt: nil)
    }
    var isEmpty: Bool {
        name.isEmpty
    }
}
