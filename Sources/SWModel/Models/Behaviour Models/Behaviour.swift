//
//  Behaviour.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public enum Orientation: String, Codable {
    case leftToRight = "left-to-right"
    case rightToLeft = "right-to-left"
}


public struct Behaviour: Codable, Equatable {
    public static func == (lhs: Behaviour, rhs: Behaviour) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id: String
    public var name: String
    public var min: Int?
    public var max: Int?
    public var numberOfDecimals: Int?
    public var orientation: Orientation?
    public var options: [String]?
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case min
        case max
        case numberOfDecimals
        case orientation
        case options
    }
    
}

extension Behaviour: Comparable {
    public static func < (lhs: Behaviour, rhs: Behaviour) -> Bool {
        return lhs.name < rhs.name
    }
}
