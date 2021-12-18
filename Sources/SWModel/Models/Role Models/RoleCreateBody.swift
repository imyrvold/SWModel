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
    public var id: ObjectId?
    public var name: String
    public var claims: [ObjectId]
    
    public init(id: ObjectId?, name: String, claims: [ObjectId]) {
        self.id = id
        self.name = name
        self.claims = claims
    }
}

public extension RoleCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
