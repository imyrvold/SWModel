//
//  SubmenuCreateResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 26/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct SubmenuCreateResponse {
    public let id: String
    public let name: String
    public let claim: String
    public let link: String
    public let newTab: Bool?
}
extension SubmenuCreateResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case claim
        case link
        case newTab
    }
}
