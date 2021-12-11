//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 11/12/2021.
//

import Foundation
import BSON

public struct RoleResponseLegacy: Codable {
    public let id: ObjectId
    public let name: String
    public var claims: [ClaimResponseLegacy]
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

    static func json(from response: [RoleResponseLegacy]) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let rolesOutput = response.map { Self.roleResponse(from: $0) }
        
        let rolesData = try encoder.encode(rolesOutput)
        if let json = String(data: rolesData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

    static func json(from response: RoleResponseLegacy) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let roleOutput = Self.roleResponse(from: response)
        
        let rolesData = try encoder.encode(roleOutput)
        if let json = String(data: rolesData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

}
