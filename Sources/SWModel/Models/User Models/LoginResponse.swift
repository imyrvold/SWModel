//
//  LoginResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct LoginResponse: Codable {
    public var user: UserLoginResponse
    public var accessToken: String
    public var refreshToken: String


    public init() {
        self.user = UserLoginResponse.empty
        self.accessToken = ""
        self.refreshToken = ""
    }
    
    public init(user: UserLoginResponse, accessToken: String, refreshToken: String) {
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
        LoginResponse(user: UserLoginResponse.empty, accessToken: "", refreshToken: "")
    }()
}
