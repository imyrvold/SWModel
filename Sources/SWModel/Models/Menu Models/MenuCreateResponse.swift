//
//  MenuCreateResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct MenuCreateResponse {
    public let id: String
    public let name: String
    public let claim: String
    public var submenus: [SubmenuCreateResponse] = []
}
extension MenuCreateResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case claim
        case submenus
    }
}
