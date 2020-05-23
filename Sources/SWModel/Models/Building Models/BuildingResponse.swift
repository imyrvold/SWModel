//
//  BuildingResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 29/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct BuildingResponse {
    public let id: String
    public let name: String
    public let address: String?
    public let imageUrl: String?
    public let index: String?
    public let pages: [String]?
    public let menus: [BuildingMenuResponse]?
    public let links: [Link]?
    public let position: Int?
    public let claim: String
    public let company: String?
}
typealias BuildingsResponse = [BuildingResponse]

extension BuildingResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
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
    public let id: String
    public let name: String
    public let claim: String
    public var submenus: [BuildingSubmenuResponse] = []
}
typealias BuildingsMenuResponse = [BuildingMenuResponse]

extension BuildingMenuResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case claim
        case submenus
    }
}

public struct BuildingSubmenuResponse {
    public let id: String
    public let name: String
    public let claim: String?
    public let link: String
    public let newTab: Bool?
}
extension BuildingSubmenuResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case claim
        case link
        case newTab
    }
}
