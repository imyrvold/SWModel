//
//  UserUpdateResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 01/03/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
public struct UserUpdateResponse: Decodable {
    public let id: String
    public var fullName: String
    public var email: String
    public var role: String
    
    public init(id: String, fullName: String, lastName: String, email: String, role: String) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.role = role
    }

    
    public enum CodingKeys: String, CodingKey {
        case id
        case fullName
        case email
        case role
    }
}
