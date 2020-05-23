//
//  MenuResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 23/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct MenuResponse {
    public let id: String
    public let name: String
    public let claim: Claim
    public var submenus: [SubmenuResponse] = []
    
    public init(id: String, name: String, claim: Claim, submenus: [SubmenuResponse]) {
        self.id = id
        self.name = name
        self.claim = claim
        self.submenus = submenus
    }

}

extension MenuResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case claim
        case submenus
    }
}
