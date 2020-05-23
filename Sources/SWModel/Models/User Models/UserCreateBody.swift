//
//  UserCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/01/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct UserCreateBody: Encodable {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var role: String
    var isHidden: Bool
}
