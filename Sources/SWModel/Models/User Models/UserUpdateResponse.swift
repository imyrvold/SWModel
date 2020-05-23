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
    public var firstName: String
    public var lastName: String
    public var email: String
    public var role: String
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName
        case lastName
        case email
        case role
    }
}
