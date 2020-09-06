//
//  User.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct User: Codable, Equatable, Comparable, Identifiable, CustomStringConvertible, SidebarItemable {
    public var menuName: NavigationItem {
        .users
    }
    
    public var name: String {
        fullName
    }
    
    public static func < (lhs: User, rhs: User) -> Bool {
        lhs.fullName < rhs.fullName
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id: String
    public var fullName: String
    public var email: String
    public var role: Role
    public var isHidden: Bool? = false
    
    public static var empty: User {
        User(id: "", fullName: "", email: "", role: Role.empty)
    }
    
    public init(id: String, fullName: String, email: String, role: Role, isHidden: Bool = false) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.role = role
        self.isHidden = isHidden
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case fullName
        case email
        case role
        case isHidden
    }
    
    public var description: String {
        return "id: \(id) fullName: \(fullName), email: \(email), role: \(role)"
    }
    
}

