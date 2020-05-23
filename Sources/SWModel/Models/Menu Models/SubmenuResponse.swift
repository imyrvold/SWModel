//
//  SubmenuResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct SubmenuResponse {
    public let id: String
    public let name: String
    public let claim: Claim
    public let link: String
    public let newTab: Bool?
}
extension SubmenuResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case claim
        case link
        case newTab
    }
}
