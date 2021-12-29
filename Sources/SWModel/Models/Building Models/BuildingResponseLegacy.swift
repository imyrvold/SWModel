//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 29/12/2021.
//

import Foundation
import BSON

public struct BuildingResponseLegacy: Decodable {
    public struct LinkResponseMinimum: Codable {
        public let id: ObjectId
        public let group: String
        public let label: String
        public let link: String
        public let newTab: Bool?
    }
    
    public let id: ObjectId?
    public let name: String
    public let address: String?
    public let imageUrl: String?
    public let index: ObjectId?
    public let pages: [ObjectId]?
    public let menus: [ObjectId]?
    public let links: [LinkResponseMinimum]?
    public let position: Int?
    public let claim: ObjectId
    public let company: ObjectId?
    public let createdOn: String
    public let updatedOn: String
    public let deletedOn: String?

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
        case createdOn
        case updatedOn
        case deletedOn
    }

}
