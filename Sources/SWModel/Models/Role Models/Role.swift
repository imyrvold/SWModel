//
//  Role.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Role: Codable, Comparable, Identifiable, Hashable, Equatable {
    public static func == (lhs: Role, rhs: Role) -> Bool {
        return lhs.id == rhs.id
    }
    
    public static func < (lhs: Role, rhs: Role) -> Bool {
        lhs.name < rhs.name
    }

    public let id: String
    public var name: String
    public var claims: [Claim]
    
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case claims
    }
}

public extension Role {
    static var empty: Role {
        return Role(id: "", name: "", claims: [])
    }
}
