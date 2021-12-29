//
//  BuildingCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 29/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct BuildingCreateBody: Encodable {
    public let id: ObjectId?
    let name: String
    let address: String?
    let imageUrl: String?
    let index: ObjectId?
    let pages: [ObjectId]?
    let menus: [ObjectId]?
    let links: [ObjectId]?
    let position: Int?
    let claim: ObjectId
    let company: ObjectId?
    
    public init(id: ObjectId?, name: String, address: String?, imageUrl: String?, index: ObjectId?, pages: [ObjectId]?, menus: [ObjectId]?, links: [ObjectId]?, position: Int?,
        claim: ObjectId, company: ObjectId?) {
        self.id = id
        self.name = name
        self.address = address
        self.imageUrl = imageUrl
        self.index = index
        self.pages = pages
        self.menus = menus
        self.links = links
        self.position = position
        self.claim = claim
        self.company = company
    }
}

public extension BuildingCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
