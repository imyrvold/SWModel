//
//  PageCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 17/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct PageCreateBody: Encodable {
    public let id: ObjectId?
    public let name: String
    public let title: String
    public let label: String?
    public let logo: String?
    public let company: String?
    public let elements: [ObjectId]
    public let claim: ObjectId
    public let style: String?
    
    public init(id: ObjectId?, name: String, title: String, label: String?, logo: String?, company: String?, elements: [ObjectId], claim: ObjectId, style: String?) {
        self.id = id
        self.name = name
        self.title = title
        self.label = label
        self.logo = logo
        self.company = company
        self.elements = elements
        self.claim = claim
        self.style = style
    }
}

public extension PageCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
