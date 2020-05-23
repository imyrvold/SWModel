//
//  PageResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct PageResponse {
    public let id: String
    public let name: String
    public let title: String
    public let label: String?
    public let logo: String?
    public let company: String?
    public let elements: [String]
    public let claim: String
    public let style: String?
    public var claims: [Claim] = []
    
    public init(id: String, name: String, title: String, label: String?, logo: String?, company: String?, elements: [String], claim: String, style: String?, claims: [Claim]) {
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
extension PageResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
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
