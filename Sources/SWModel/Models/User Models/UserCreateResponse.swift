//
//  UserCreateResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 09/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct UserCreateResponse: Decodable {
    public let id: String
    public var firstName: String
    public var lastName: String
    public var email: String
    public var role: String
    public var token: String
    public var isHidden: Bool?
    
    public init(id: String, firstName: String, lastName: String, email: String, role: String, token: String, isHidden: Bool?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.role = role
        self.token = token
        self.isHidden = isHidden
    }

    
    public enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case role
        case token
        case isHidden
    }
}
