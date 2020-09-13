//
//  Claim.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Claim: Codable, Hashable, Identifiable, SidebarItemable {
    public let id: String
    public var name: String
    public var updatedAt: Date
    public var createdAt: Date
    public var deletedAt: Date?
    public var menuName: NavigationItem {
        .claims
    }

    public init(id: String, name: String, createdAt: Date, updatedAt: Date, deletedAt: Date?) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
}

extension Claim: Equatable {
    public static func == (lhs: Claim, rhs: Claim) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension Claim: Comparable {
    public static func < (lhs: Claim, rhs: Claim) -> Bool {
        return lhs.name < rhs.name
    }
}

public extension Claim {
    static var empty: Claim {
        let date = Date()
        return Claim(id: "", name: "", createdAt: date, updatedAt: date, deletedAt: nil)
    }
    
    var isEmpty: Bool {
        return self.id.isEmpty || name.isEmpty
    }
}
