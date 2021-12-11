//
//  ClaimCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 02/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct ClaimCreateBody: Encodable {
    public var id: ObjectId?
    public var name: String
    
    public init(id: ObjectId?, name: String) {
        self.id = id
        self.name = name
    }
}

public extension ClaimCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
