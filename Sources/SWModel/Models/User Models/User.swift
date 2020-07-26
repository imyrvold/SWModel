//
//  User.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct User: Codable, Equatable, Comparable, Identifiable, CustomStringConvertible {
    public static func < (lhs: User, rhs: User) -> Bool {
        lhs.firstName < rhs.firstName
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id: String
    public var firstName: String
    public var lastName: String
    public var email: String
    public var role: Role
    public var isHidden: Bool? = false
    
    public init(id: String, firstName: String, lastName: String, email: String, role: Role, isHidden: Bool = false) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.role = role
        self.isHidden = isHidden
    }

    public var fullName: String {
        firstName + " " + lastName
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case role
        case isHidden
    }
    
    public var description: String {
        return "id: \(id) firstName: \(firstName), lastName: \(lastName), email: \(email), role: \(role)"
    }
    
}

