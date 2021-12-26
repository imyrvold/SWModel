//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 26/12/2021.
//

import Foundation
import BSON

public struct MenuResponseLegacy: Decodable {
    public struct ClaimResponseMinimum: Codable {
        let id: ObjectId
        let name: String
        
        public enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name
        }
    }

    public struct SubmenuResponseMinimum: Codable {
        let id: ObjectId
        let name: String
        let link: String
        let claim: Claim
        let newTab: Bool?
        
        public enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name
            case link
            case claim
            case newTab
        }
    }

    public let id: ObjectId
    public let name: String
    public let claim: ClaimResponseMinimum
    public let submenus: [SubmenuResponseMinimum]
    public let createdOn: String
    public let updatedOn: String
    public let deletedOn: String?
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case claim
        case submenus
        case createdOn
        case updatedOn
        case deletedOn
    }

}

public extension MenuResponseLegacy {
    struct Menu: Encodable {
        public let id: String
        public let name: String
        public let claim: String
        public let submenus: [String]
        public let createdOn: String
        public let updatedOn: String
        public let deletedOn: String?
    }
    
    static func menuResponse(from response: MenuResponseLegacy) -> Menu {
        let submenus = response.submenus.compactMap { $0.id.hexString }
        return Menu(id: response.id.hexString, name: response.name, claim: response.claim.id.hexString, submenus: submenus, createdOn: response.createdOn, updatedOn: response.updatedOn, deletedOn: response.deletedOn)
    }

    static func menusResponse(from response: [MenuResponseLegacy]) -> [Menu] {
        response.map { menuResponseLegacy in
            let submenus = menuResponseLegacy.submenus.compactMap { $0.id.hexString }
            return Menu(id: menuResponseLegacy.id.hexString, name: menuResponseLegacy.name, claim: menuResponseLegacy.claim.id.hexString, submenus: submenus, createdOn: menuResponseLegacy.createdOn, updatedOn: menuResponseLegacy.updatedOn, deletedOn: menuResponseLegacy.deletedOn)
        }
    }

}
