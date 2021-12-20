//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 19/12/2021.
//

import Foundation
import BSON

public struct CompanyResponse: Codable {
    public let id: ObjectId
    public var title: String
    public var icons: [CompanyIcon]
    public var logo: String?
    public var def: Bool
    public var buildingTabName: String?
    public var buildingUrl: String?
    public let createdAt: String
    public let updatedAt: String
    public let deletedAt: String?
}

public extension CompanyResponse {
    struct Company: Encodable {
        public let id: String
        public let title: String
        public var icons: [CompanyIcon]
        public let logo: String?
        public var def: Bool = false
        public var buildingTabName: String?
        public var buildingUrl: String?
        public let createdAt: String
        public let updatedAt: String
        public let deletedAt: String?
    }

    static func companyResponse(from response: CompanyResponse) -> Company {
        Company(id: response.id.hexString, title: response.title, icons: response.icons, logo: response.logo, def: response.def, buildingTabName: response.buildingTabName, buildingUrl: response.buildingUrl, createdAt: response.createdAt, updatedAt: response.updatedAt, deletedAt: response.deletedAt)
    }

    static func companiesResponse(from response: [CompanyResponse]) -> [Company] {
        response.map { companyResponse in
            return Company(id: companyResponse.id.hexString, title: companyResponse.title, icons: companyResponse.icons, logo: companyResponse.logo, def: companyResponse.def, buildingTabName: companyResponse.buildingTabName, buildingUrl: companyResponse.buildingUrl, createdAt: companyResponse.createdAt, updatedAt: companyResponse.updatedAt, deletedAt: companyResponse.deletedAt)
        }
    }
}
