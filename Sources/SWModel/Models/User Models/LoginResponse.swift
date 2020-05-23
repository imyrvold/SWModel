//
//  LoginResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct LoginResponse: Codable {
    public let id: String
    public var firstName: String
    public var lastName: String
    public var email: String
    public let role: String
    public var token: String
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName
        case lastName
        case email
        case token
        case role
    }


    public init() {
        self.id = ""
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.role = ""
        self.token = ""
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

extension LoginResponse: CustomDebugStringConvertible {
    public var debugDescription: String {
    return "\nid: \(id)\nfirstName: \"\(firstName)\" lastName: \"\(lastName)\" email: \"\(email)\"\nrole: \"\(role)\" \ntoken: \(token)"
  }
}
typealias CreateUserResponse = LoginResponse
typealias UserResponse = LoginResponse

public extension LoginResponse {
    static let empty = {
       LoginResponse(id: "", firstName: "", lastName: "", email: "", role: "", token: "")
    }()
}
