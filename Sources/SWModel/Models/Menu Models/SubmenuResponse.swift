//
//  SubmenuResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct SubmenuResponse {
    public let id: ObjectId
    public let name: String
    public let claim: String
    public let link: String
    public let newTab: Bool?
    
    public init(id: ObjectId, name: String, claim: Claim, link: String, newTab: Bool?) {
        self.id = id
        self.name = name
        self.claim = claim
        self.link = link
        self.newTab = newTab
    }

}
extension SubmenuResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case claim
        case link
        case newTab
    }
}
