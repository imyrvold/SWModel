//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 13/09/2020.
//

import Foundation
import BSON

public struct ClaimResponse: Codable {
    public let id: ObjectId
    public let name: String
    public let createdAt: String
    public let updatedAt: String
    public let deletedAt: String?
}

public extension ClaimResponse {
    struct ClaimJson: Encodable {
        let id: String
        let name: String
        let createdAt: String
        let updatedAt: String
        let deletedAt: String?
    }
    
    static func claimJson(from response: ClaimResponse) -> ClaimJson {
        ClaimJson(id: response.id.hexString, name: response.name, createdAt: response.createdAt, updatedAt: response.updatedAt, deletedAt: response.deletedAt)
    }

    static func json(from response: [ClaimResponse]) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let claimsOutput = response.map { Self.claimJson(from: $0) }
        
        let claimsData = try encoder.encode(claimsOutput)
        if let json = String(data: claimsData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

    static func json(from response: ClaimResponse) throws -> String {
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
