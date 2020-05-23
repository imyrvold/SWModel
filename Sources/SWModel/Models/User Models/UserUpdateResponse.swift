//
//  UserUpdateResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 01/03/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
struct UserUpdateResponse: Decodable {
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
