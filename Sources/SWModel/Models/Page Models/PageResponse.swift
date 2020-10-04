//
//  PageResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct PageResponse {
    public let id: String
    public let name: String
    public let title: String
    public let label: String?
    public let logo: String?
    public let company: String?
    public let elements: [String]
    public let claim: ObjectId
    public let style: String?
    public var claims: [Claim] = []
    
    public init(id: String, name: String, title: String, label: String?, logo: String?, company: String?, elements: [String], claim: ObjectId, style: String?, claims: [Claim]) {
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
extension PageResponse: Decodable {}
