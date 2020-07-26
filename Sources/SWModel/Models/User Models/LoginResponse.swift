//
//  LoginResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct LoginResponse: Codable {
    public let user: User
    public var accessToken: String
    public var refreshToken: String


    public init() {
        self.user = User.empty
        self.accessToken = ""
        self.refreshToken = ""
    }
    
    public init(user: User, accessToken: String, refreshToken: String) {
        self.user = user
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}

extension LoginResponse: CustomDebugStringConvertible {
    public var debugDescription: String {
    return "\nuser: \(user) \naccessToken: \(accessToken) \nrefreshToken: \(refreshToken)"
  }
}
typealias CreateUserResponse = LoginResponse
typealias UserResponse = LoginResponse

public extension LoginResponse {
    static let empty = {
        LoginResponse(user: User.empty, accessToken: "", refreshToken: "")
    }()
}
