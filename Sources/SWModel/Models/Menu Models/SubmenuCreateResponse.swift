//
//  SubmenuCreateResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 26/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct SubmenuCreateResponse {
    public let id: ObjectId
    public let name: String
    public let claim: ObjectId
    public let link: String
    public let newTab: Bool?
    
    public init(id: ObjectId, name: String, claim: ObjectId, link: String, newTab: Bool?) {
        self.id = id
        self.name = name
        self.claim = claim
        self.link = link
        self.newTab = newTab
    }

}
extension SubmenuCreateResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case claim
        case link
        case newTab
    }
}
