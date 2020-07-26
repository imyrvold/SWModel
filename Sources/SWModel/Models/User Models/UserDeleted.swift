//
//  UserDeleted.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 08/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct UserDeleted: Codable {
    public let id: String
    public var firstName: String
    public var lastName: String
    public var email: String
    public var role: String
    
    public init(id: String, firstName: String, lastName: String, email: String, role: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.role = role
    }

    
    public enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case role
    }
    
}
