//
//  RoleCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/01/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct RoleCreateBody: Encodable {
    public var name: String
    public var claims: [ObjectId]
    
    public init(name: String, claims: [ObjectId]) {
        self.name = name
        self.claims = claims
    }
}

public extension RoleCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
