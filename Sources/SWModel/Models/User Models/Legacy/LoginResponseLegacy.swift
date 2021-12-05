//
//  LoginResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct LoginResponseLegacy: Codable {
    public var id: String
    public var firstName: String
    public var lastName: String
    public var email: String
    public var role: String
    public var token: String

    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName
        case lastName
        case email
        case role
        case token
    }

    public init() {
        self = LoginResponseLegacy.empty
    }
    
    public init(id: String, firstName: String, lastName: String, email: String, role: String, token: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.role = role
        self.token = token
    }
}

extension LoginResponseLegacy: CustomDebugStringConvertible {
    public var debugDescription: String {
    return "\nid: \(id) firstName: \(firstName) lastName: \(lastName) email: \(email) role: \(role) \ntoken: \(token)"
  }
}

public extension LoginResponseLegacy {
    static let empty = {
        LoginResponseLegacy(id: "", firstName: "", lastName: "", email: "", role: "", token: "")
    }()
}
