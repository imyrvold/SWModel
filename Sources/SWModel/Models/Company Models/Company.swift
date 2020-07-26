//
//  Company.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 15/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Company: Codable, Identifiable {
    public let id: String
    public let title: String
    public var icons: [CompanyIcon] = []
    public let logo: String?
    public var def: Bool = false
    public var buildingTabName: String?
    public var buildingUrl: String?
    
    public init(id: String, title: String, icons: [CompanyIcon], logo: String?, def: Bool, buildingTabName: String?, buildingUrl: String?) {
        self.id = id
        self.title = title
        self.icons = icons
        self.logo = logo
        self.def = def
        self.buildingTabName = buildingTabName
        self.buildingUrl = buildingUrl
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case title
        case icons
        case logo
        case def = "default"
        case buildingTabName
        case buildingUrl
    }
}
extension Company: Equatable {
    public static func == (lhs: Company, rhs: Company) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension Company: Comparable {
    public static func < (lhs: Company, rhs: Company) -> Bool {
        return lhs.title < rhs.title
    }
}

extension Company {
    public static var empty: Company {
        return Company(id: "", title: "", icons: [], logo: nil, def: false, buildingTabName: nil, buildingUrl: nil)
    }
}
