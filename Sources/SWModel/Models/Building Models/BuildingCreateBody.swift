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
    let name: String
    let address: String?
    let imageUrl: String?
    let index: String?
    let pages: [String]?
    let menus: [String]?
    let links: [Link]?
    let position: Int?
    let claim: ObjectId
    let company: String?
    
    public init(name: String, address: String?, imageUrl: String?, index: String?, pages: [String]?, menus: [String]?, links: [Link]?, position: Int?,
        claim: ObjectId, company: String?) {
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
