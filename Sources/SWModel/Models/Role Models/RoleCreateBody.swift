//
//  RoleCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/01/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct RoleCreateBody: Encodable {
    var name: String
    var claims: [Claim]
}
