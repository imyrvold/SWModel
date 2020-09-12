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
    
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case createdAt
        case updatedAt
        case deletedAt
    }
    
    public init(from decoder: Decoder) throws {
        print("Claim init from decoder 1")
        let container = try decoder.container(keyedBy: CodingKeys.self)
        print("Claim init from decoder 2")
        self.id = try container.decode(String.self, forKey: .id)
        print("Claim init from decoder 3")
        self.name = try container.decode(String.self, forKey: .name)
        print("Claim init from decoder 4")
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        print("Claim init from decoder 5")
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        print("Claim init from decoder 6")
        self.deletedAt = try? container.decode(Date.self, forKey: .deletedAt)
        print("Claim init from decoder 7")
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
