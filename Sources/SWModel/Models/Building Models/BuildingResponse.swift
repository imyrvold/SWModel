//
//  BuildingResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 29/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct BuildingResponse {
    public let id: ObjectId?
    public let name: String
    public let address: String?
    public let imageUrl: String?
    public let index: ObjectId?
    public let pages: [ObjectId]?
    public let menus: [ObjectId]?
    public let links: [ObjectId]?
    public let position: Int?
    public let claim: ObjectId
    public let company: ObjectId?
    
    public init(id: ObjectId, name: String, address: String?, imageUrl: String?, index: ObjectId?, pages: [ObjectId]?, menus: [ObjectId]?, links: [ObjectId]?, position: Int?,
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
typealias BuildingsResponse = [BuildingResponse]

extension BuildingResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case imageUrl
        case index
        case pages
        case menus
        case links
        case position
        case claim
        case company
    }
}

public struct BuildingMenuResponse {
    public let id: ObjectId
    public let name: String
    public let claim: ObjectId
    public var submenus: [BuildingSubmenuResponse] = []
    
    public init(id: ObjectId, name: String, claim: ObjectId, submenus: [BuildingSubmenuResponse]) {
        self.id = id
        self.name = name
        self.claim = claim
        self.submenus = submenus
    }
}
typealias BuildingsMenuResponse = [BuildingMenuResponse]

extension BuildingMenuResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case claim
        case submenus
    }
}

public struct BuildingSubmenuResponse {
    public let id: ObjectId
    public let name: String
    public let claim: ObjectId?
    public let link: String
    public let newTab: Bool?
    
    public init(id: ObjectId, name: String, claim: ObjectId, link: String, newTab: Bool?) {
        self.id = id
        self.name = name
        self.claim = claim
        self.link = link
        self.newTab = newTab
    }

}
extension BuildingSubmenuResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case claim
        case link
        case newTab
    }
}
