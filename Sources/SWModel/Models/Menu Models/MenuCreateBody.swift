//
//  MenuCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct MenuCreateBody: Encodable {
    public let id: ObjectId?
    public let name: String
    public let claim: ObjectId
    public let submenus: [SubmenuCreateBody]
    
    public init(id: ObjectId?, name: String, claim: ObjectId, submenus: [SubmenuCreateBody]) {
        self.id = id
        self.name = name
        self.claim = claim
        self.submenus = submenus
    }
}

public extension MenuCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
