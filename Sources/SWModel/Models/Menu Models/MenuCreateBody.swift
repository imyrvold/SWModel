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
    public let name: String
    public let claim: ObjectId
    public let submenus: [SubmenuCreateBody]
    
    public init(name: String, claim: ObjectId, submenus: [SubmenuCreateBody]) {
        self.name = name
        self.claim = claim
        self.submenus = submenus
    }
}
