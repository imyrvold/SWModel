//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 06/12/2021.
//

import Foundation
import BSON

public struct ClaimResponseLegacy: Codable {
    public let id: ObjectId
    public let name: String
    public let createdOn: String
    public let updatedOn: String
    public let deletedOn: String?
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case createdOn
        case updatedOn
        case deletedOn
    }
}

public extension ClaimResponseLegacy {
    struct ClaimJson: Encodable {
        let id: String
        let name: String
        let createdOn: String
        let updatedOn: String
        let deletedOn: String?
    }
    
    static func claimJson(from response: ClaimResponseLegacy) -> ClaimJson {
        ClaimJson(id: response.id.hexString, name: response.name, createdOn: response.createdOn, updatedOn: response.updatedOn, deletedOn: response.deletedOn)
    }

    static func json(from response: [ClaimResponseLegacy]) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let claimsOutput = response.map { Self.claimJson(from: $0) }
        
        let claimsData = try encoder.encode(claimsOutput)
        if let json = String(data: claimsData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

    static func json(from response: ClaimResponseLegacy) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let claimOutput = Self.claimJson(from: response)
        
        let claimsData = try encoder.encode(claimOutput)
        if let json = String(data: claimsData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }
}