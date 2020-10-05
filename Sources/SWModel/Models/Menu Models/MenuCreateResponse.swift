//
//  MenuCreateResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct MenuCreateResponse {
    public let id: ObjectId
    public let name: String
    public let claim: ObjectId
    public var submenus: [SubmenuCreateResponse] = []
    
    public init(id: ObjectId, name: String, claim: ObjectId, submenus: [SubmenuCreateResponse]) {
        self.id = id
        self.name = name
        self.claim = claim
        self.submenus = submenus
    }

}
extension MenuCreateResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case claim
        case submenus
    }
}
