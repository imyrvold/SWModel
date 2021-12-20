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
}
