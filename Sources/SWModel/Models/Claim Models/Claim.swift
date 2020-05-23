//
//  Claim.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Claim: Codable, Hashable, Identifiable {
    public let id: String
    public var name: String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}

typealias ClaimsResponse = [Claim]

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
        return Claim(id: "", name: "")
    }
    
    var isEmpty: Bool {
        return self.id.isEmpty || name.isEmpty
    }
}
