//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 19/12/2021.
//

import Foundation
import BSON

public struct CompanyResponseLegacy: Codable {
    public let id: ObjectId
    public let title: String
    public var icons: [CompanyIcon]
    public let logo: String?
    public var def: Bool = false
    public var buildingTabName: String?
    public var buildingUrl: String?
    public let createdOn: String
    public let updatedOn: String
    public let deletedOn: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case icons
        case logo
        case def
        case buildingTabName
        case buildingUrl
        case createdOn
        case updatedOn
        case deletedOn
    }
}

public extension CompanyResponseLegacy {
    struct Company: Encodable {
        public let id: String
        public let title: String
        public var icons: [CompanyIcon]
        public let logo: String?
        public var def: Bool = false
        public var buildingTabName: String?
        public var buildingUrl: String?
        public let createdOn: String
        public let updatedOn: String
        public let deletedOn: String?
    }
    
    static func companyResponse(from response: CompanyResponseLegacy) -> Company {
        Company(id: response.id.hexString, title: response.title, icons: response.icons, logo: response.logo, createdOn: response.createdOn, updatedOn: response.updatedOn, deletedOn: response.deletedOn)
    }
    
    static func companiesResponse(from response: [CompanyResponseLegacy]) -> [Company] {
        response.map { companyResponseLegacy in
            return Company(id: companyResponseLegacy.id.hexString, title: companyResponseLegacy.title, icons: companyResponseLegacy.icons, logo: companyResponseLegacy.logo, def: companyResponseLegacy.def, buildingTabName: companyResponseLegacy.buildingTabName, buildingUrl: companyResponseLegacy.buildingUrl, createdOn: companyResponseLegacy.createdOn, updatedOn: companyResponseLegacy.updatedOn, deletedOn: companyResponseLegacy.deletedOn)
        }
    }
    
    static func json(from response: [CompanyResponseLegacy]) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let companiesOutput = response.map { Self.companyResponse(from: $0) }
        
        let companiesData = try encoder.encode(companiesOutput)
        if let json = String(data: companiesData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }
    
    static func json(from response: CompanyResponseLegacy) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let companyOutput = Self.companyResponse(from: response)
        
        let companiesData = try encoder.encode(companyOutput)
        if let json = String(data: companiesData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

}
