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
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName
        case lastName
        case email
        case role
        case token
        case isHidden
    }
}
