//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 11/12/2021.
//

import Foundation
import BSON

public struct RoleResponseLegacy: Codable {
    public struct ClaimResponseMinimum: Codable {
        let id: ObjectId
        let name: String
        
        public enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name
        }
    }
    public let id: ObjectId
    public let name: String
    public var claims: [ClaimResponseMinimum]
    public let createdOn: String
    public let updatedOn: String
    public let deletedOn: String?

    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case claims
        case createdOn
        case updatedOn
        case deletedOn
    }
}

public extension RoleResponseLegacy {
    struct Role: Encodable {
        public let id: String
        public let name: String
        public let claims: [String]
        public let createdOn: String
        public let updatedOn: String
        public let deletedOn: String?
    }

    static func roleResponse(from response: RoleResponseLegacy) -> Role {
        let claims = response.claims.map { $0.id.hexString }
        return Role(id: response.id.hexString, name: response.name, claims: claims, createdOn: response.createdOn, updatedOn: response.updatedOn, deletedOn: response.deletedOn)
    }

    static func rolesResponse(from response: [RoleResponseLegacy]) -> [Role] {
        response.map { roleResponseLegacy in
            let claims = roleResponseLegacy.claims.map { $0.id.hexString }
            return Role(id: roleResponseLegacy.id.hexString, name: roleResponseLegacy.name, claims: claims, createdOn: roleResponseLegacy.createdOn, updatedOn: roleResponseLegacy.updatedOn, deletedOn: roleResponseLegacy.deletedOn)
        }
    }
}
