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


public struct Behaviour: Codable, Equatable, SidebarItemable {
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
    public var updatedAt: Date
    public var createdAt: Date
    public var deletedAt: Date?
    public var menuName: NavigationItem {
        .behaviours
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
        return Behaviour(id: nil, name: "", min: nil, max: nil, numberOfDecimals: nil, orientation: nil, options: nil, updatedAt: date, createdAt: date, deletedAt: nil)
    }
}
