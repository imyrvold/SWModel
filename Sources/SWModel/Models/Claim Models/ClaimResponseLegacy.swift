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
}
