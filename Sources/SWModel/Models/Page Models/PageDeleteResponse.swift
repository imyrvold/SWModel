//
//  PageDeleteResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct PageDeleteResponse {
    public let id: ObjectId
    public let name: String
    public let title: String
    public let label: String?
    public let logo: String?
    public let company: ObjectId?
    public let elements: [Element]
    public let claim: ObjectId
    public let style: String?
    public var claims: [Claim] = []
    
    public init(id: ObjectId, name: String, title: String, label: String?, logo: String?, company: ObjectId?, elements: [Element], claim: ObjectId, style: String?, claims: [Claim]) {
        self.id = id
        self.name = name
        self.title = title
        self.label = label
        self.logo = logo
        self.company = company
        self.elements = elements
        self.claim = claim
        self.style = style
        self.claims = claims
    }

}
extension PageDeleteResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
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
