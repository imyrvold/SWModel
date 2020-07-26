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
    public var fullName: String
    public var email: String
    public let role: String
    public var token: String
    

    public init() {
        self.id = ""
        self.fullName = ""
        self.email = ""
        self.role = ""
        self.token = ""
    }
    
    public init(id: String, fullName: String, email: String, role: String, token: String) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.role = role
        self.token = token
    }
}

extension LoginResponse: CustomDebugStringConvertible {
    public var debugDescription: String {
    return "\nid: \(id)\nfullName: \"\(fullName)\" email: \"\(email)\"\nrole: \"\(role)\" \ntoken: \(token)"
  }
}
typealias CreateUserResponse = LoginResponse
typealias UserResponse = LoginResponse

public extension LoginResponse {
    static let empty = {
       LoginResponse(id: "", fullName: "", email: "", role: "", token: "")
    }()
}
