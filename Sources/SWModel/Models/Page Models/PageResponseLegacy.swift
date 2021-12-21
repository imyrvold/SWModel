//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 21/12/2021.
//

import Foundation
import BSON

public struct PageResponseLegacy {
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
    public let title: String
    public let label: String?
    public let logo: String?
    public let company: ObjectId?
    public let elements: [ObjectId]
    public let claim: ClaimResponseMinimum?
    public let style: String?
    public var claims: [ObjectId] = []
    public let createdOn: String
    public let updatedOn: String
    public let deletedOn: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case title
        case label
        case logo
        case company
        case elements
        case claim
        case style
        case claims
        case createdOn
        case updatedOn
        case deletedOn
    }

}
extension PageResponseLegacy: Decodable {}

public extension PageResponseLegacy {
    struct Page: Encodable {
        public let id: String
        public let name: String
        public let title: String
        public let label: String?
        public let logo: String?
        public let company: String?
        public let elements: [String]
        public let claim: String?
        public let style: String?
        public let claims: [String]
    }
    
    static func pageResponse(from response: PageResponseLegacy) -> Page {
        let claims = response.claims.map { $0.hexString }
        let elements = response.elements.compactMap { $0.hexString }
        return Page(id: response.id.hexString, name: response.name, title: response.title, label: response.label, logo: response.logo, company: response.company?.hexString, elements: elements, claim: response.id.hexString, style: response.style, claims: claims)
    }
    
    static func pagesResponse(from response: [PageResponseLegacy]) -> [Page] {
        response.map { pageResponseLegacy in
            let claims = pageResponseLegacy.claims.map { $0.hexString }
            let elements = pageResponseLegacy.elements.compactMap { $0.hexString }
            return Page(id: pageResponseLegacy.id.hexString, name: pageResponseLegacy.name, title: pageResponseLegacy.title, label: pageResponseLegacy.label, logo: pageResponseLegacy.logo, company: pageResponseLegacy.company?.hexString, elements: elements, claim: pageResponseLegacy.claim?.id.hexString, style: pageResponseLegacy.style, claims: claims)
        }
    }
}
