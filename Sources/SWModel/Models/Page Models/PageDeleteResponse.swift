//
//  PageDeleteResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct PageDeleteResponse {
    let id: String
    let name: String
    let title: String
    let label: String?
    let logo: String?
    let company: String?
    let elements: [Element]
    let claim: String
    let style: String?
    var claims: [Claim] = []
}
extension PageDeleteResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case title
        case label
        case logo
        case company
        case elements
        case claim
        case style
        case claims
    }
}
