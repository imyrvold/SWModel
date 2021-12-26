//
//  SubmenuCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct SubmenuCreateBody: Encodable {
    public let id: ObjectId?
    public let name: String
    public let claim: ObjectId
    public let link: String
    public let newTab: Bool?
    
    public init(id: ObjectId?, name: String, claim: ObjectId, link: String, newTab: Bool?) {
        self.id = id
        self.name = name
        self.claim = claim
        self.link = link
        self.newTab = newTab
    }
}

public extension SubmenuCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
