//
//  RoleCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/01/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct RoleCreateBody: Encodable {
    public var name: String
    public var claims: [Claim]
    
    public init(name: String, claims: [Claim]) {
        self.name = name
        self.claims = claims
    }
}
