//
//  UserCreateResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 09/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct UserCreateResponse: Decodable {
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    var role: String
    var token: String
    var isHidden: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName
        case lastName
        case email
        case role
        case token
        case isHidden
    }
}
