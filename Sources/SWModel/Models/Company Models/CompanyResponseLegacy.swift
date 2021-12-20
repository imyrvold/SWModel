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
    public var def: Bool?
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
    
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(ObjectId.self, forKey: .id)
//        title = try values.decode(String.self, forKey: .title)
//        icons = try values.decode([CompanyIcon].self, forKey: .icons)
//        logo = try? values.decode(String.self, forKey: .logo)
//        if let def = try? values.decode(Bool.self, forKey: .def) {
//            self.def = def
//        } else {
//            self.def = false
//        }
//        buildingTabName = try? values.decode(String.self, forKey: .buildingTabName)
//        buildingUrl = try? values.decode(String.self, forKey: .buildingUrl)
//        createdOn = try values.decode(String.self, forKey: .createdOn)
//        updatedOn = try values.decode(String.self, forKey: .updatedOn)
//        deletedOn = try? values.decode(String.self, forKey: .deletedOn)
//    }

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
            return Company(id: companyResponseLegacy.id.hexString, title: companyResponseLegacy.title, icons: companyResponseLegacy.icons, logo: companyResponseLegacy.logo, def: companyResponseLegacy.def ?? false, buildingTabName: companyResponseLegacy.buildingTabName, buildingUrl: companyResponseLegacy.buildingUrl, createdOn: companyResponseLegacy.createdOn, updatedOn: companyResponseLegacy.updatedOn, deletedOn: companyResponseLegacy.deletedOn)
        }
    }
}