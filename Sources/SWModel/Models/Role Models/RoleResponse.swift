//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 27/07/2020.
//

import Foundation
import BSON

public struct RoleResponse: Codable {
    public let id: ObjectId
    public let name: String
    public var claims: [ObjectId]
    public let createdAT: String
    public let updatedAt: String
    public let deletedAt: String?
}

public extension RoleResponse {
    struct Role: Encodable {
        public let id: String
        public let name: String
        public let claims: [String]
        public let createdAt: String
        public let updatedAt: String
        public let deletedAt: String?
    }

    static func roleResponse(from response: RoleResponse) -> Role {
        let claims = response.claims.map { $0.hexString }
        return Role(id: response.id.hexString, name: response.name, claims: claims, createdAt: response.createdAt, updatedAt: response.updatedAt, deletedAt: response.deletedAt)
    }

    static func rolesResponse(from response: [RoleResponse]) -> [Role] {
        response.map { roleResponse in
            let claims = roleResponse.claims.map { $0.hexString }
            return Role(id: roleResponse.id.hexString, name: roleResponse.name, claims: claims, createdAt: roleResponse.createdAt, updatedAt: roleResponse.updatedAt, deletedAt: roleResponse.deletedAt)
        }
    }

    static func json(from response: [RoleResponse]) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let rolesOutput = response.map { Self.roleResponse(from: $0) }
        
        let rolesData = try encoder.encode(rolesOutput)
        if let json = String(data: rolesData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

    static func json(from response: RoleResponse) throws -> String {
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
