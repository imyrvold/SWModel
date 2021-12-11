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
    struct Claim: Encodable {
        public let id: String
        public let name: String
        public let createdOn: String
        public let updatedOn: String
        public let deletedOn: String?
    }
    
    static func claimResponse(from response: ClaimResponseLegacy) -> Claim {
        Claim(id: response.id.hexString, name: response.name, createdOn: response.createdOn, updatedOn: response.updatedOn, deletedOn: response.deletedOn)
    }
    
    static func claimsResponse(from response: [ClaimResponseLegacy]) -> [Claim] {
        response.map { Claim(id: $0.id.hexString, name: $0.name, createdOn: $0.createdOn, updatedOn: $0.updatedOn, deletedOn: $0.deletedOn) }
    }

    static func json(from response: [ClaimResponseLegacy]) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let claimsOutput = response.map { Self.claimResponse(from: $0) }
        
        let claimsData = try encoder.encode(claimsOutput)
        if let json = String(data: claimsData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

    static func json(from response: ClaimResponseLegacy) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let claimOutput = Self.claimResponse(from: response)
        
        let claimsData = try encoder.encode(claimOutput)
        if let json = String(data: claimsData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }
}
