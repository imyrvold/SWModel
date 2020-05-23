//
//  UserDeleted.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 08/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct UserDeleted: Codable {
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    var role: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName
        case lastName
        case email
        case role
    }
    
}
